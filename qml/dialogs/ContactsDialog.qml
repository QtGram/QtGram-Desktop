import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import LibQTelegram 1.0 as LibQTelegram
import "../item"

Dialog
{
    property var context

    id: contactsdialog
    title: qsTr("Contacts")
    width: 500
    height: 400

    contentItem: ListView {
        id: lvcontacts
        anchors.fill: parent

        model: LibQTelegram.ContactsModel {
            id: contactsmodel
            telegram: context.telegram
        }

        section.property: "firstLetter"

        section.delegate: Text {
            x: Theme.paddingSmall
            width: lvcontacts.width - (x * 2)
            horizontalAlignment: Text.AlignRight
            font { bold: true; pointSize: Theme.fontSizeLarge }
            text: section
        }

        delegate: ContactModelItem {
            context: contactsdialog.context
            width: parent.width
        }
    }
}
