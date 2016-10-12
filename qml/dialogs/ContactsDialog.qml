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
        anchors.fill: parent

        model: LibQTelegram.ContactsModel {
            telegram: context.telegram
        }

        delegate: ContactItem {
            context: contactsdialog.context
            tgUser: item
            width: parent.width
        }
    }
}
