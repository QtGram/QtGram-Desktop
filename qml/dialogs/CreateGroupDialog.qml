import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../component"
import "../component/theme"
import "../item"

Dialog
{
    property var context
    property bool isChannel: false

    id: creategroupdialog
    title: isChannel ? qsTr("Create channel...") : qsTr("Create group...")

    contentItem: Item {
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
            }

            delegate: ContactModelItem {
                context: creategroupdialog.context
                width: parent.width
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
                enabled: false
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Create")
            }

            ThemeButton
            {
                autoSize: true
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Cancel")
            }
        }
    }
}
