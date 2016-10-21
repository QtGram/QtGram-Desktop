import QtQuick 2.0
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../component/theme"
import "../item"

Dialog
{
    property var context

    id: contactsdialog
    title: qsTr("Contacts")
    width: 500
    height: 400

    contentItem: ThemeListView {
        id: lvcontacts
        anchors.fill: parent
        spacing: Theme.paddingSmall

        model: LibQTelegram.ContactsModel {
            id: contactsmodel
            telegram: context.telegram
        }

        header: ThemeTextField {
            width: lvcontacts.width
            placeholderText: qsTr("Search...")
        }

        section.property: "firstLetter"
        placeholderText: qsTr("No contacts")

        section.delegate: Rectangle {
            width: parent.width
            height: Theme.itemSizeExtraSmall
            color: Theme.mainColor
            z: -1

            Text {
                anchors { fill: parent; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
                horizontalAlignment: Text.AlignRight
                font { bold: true; pointSize: Theme.fontSizeLarge }
                color: Theme.mainTextColor
                text: section
            }
        }

        delegate: ContactModelItem {
            context: contactsdialog.context
            width: parent.width
        }
    }
}
