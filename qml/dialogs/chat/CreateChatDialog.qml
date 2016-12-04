import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../../component"
import "../../component/theme"
import "../../item"

Dialog
{
    property var context
    property var users
    property int usersCount: 0

    signal dialogCreated(var dialog)

    id: createchat
    title: qsTr("Create group...")

    Component.onCompleted: {
        users = new Object;
    }

    contentItem: ThemeItem {
        implicitWidth: 500
        implicitHeight: 400

        ThemeListView {
            id: lvcontacts
            anchors { left: parent.left; top: parent.top; bottom: bottombar.top; right: parent.right }
            placeholderText: qsTr("Contact list is empty")
            clip: true

            header: ThemeTextField {
                width: parent.width
                placeholderText: qsTr("Name...")
            }

            model: LibQTelegram.ContactsModel {
                id: contactsmodel
                telegram: context.telegram

                onDialogCreated: {
                    createchat.dialogCreated(dialog);
                    createchat.close();
                }
            }

            delegate: ContactModelItem {
                context: createchat.context
                width: parent.width

                onClicked: {
                    if(createchat.users[model.item.id]) {
                        delete createchat.users[model.item.id];
                        createchat.usersCount--;
                        highlighted = false;
                        return;
                    }

                    createchat.users[model.item.id] = model.item;
                    createchat.usersCount++;
                    highlighted = true;
                }
            }
        }

        Row
        {
            id: bottombar
            height: Theme.defaultHeight + (Theme.paddingMedium * 2)
            layoutDirection: Qt.RightToLeft
            spacing: Theme.paddingMedium

            anchors {
                left: parent.left
                bottom: parent.bottom
                right: parent.right
                leftMargin: Theme.paddingMedium
                rightMargin: Theme.paddingMedium
            }

            ThemeButton
            {
                autoSize: true
                enabled: (lvcontacts.headerItem.text.length > 0) && (createchat.usersCount > 0)
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Create")

                onClicked: {
                    var userlist = []

                    for(var key in createchat.users)
                        userlist.push(createchat.users[key]);

                    enabled = false;
                    contactsmodel.createChat(lvcontacts.headerItem.text, userlist);
                }
            }

            ThemeButton
            {
                autoSize: true
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Cancel")
                onClicked: createchat.close()
            }
        }
    }
}
