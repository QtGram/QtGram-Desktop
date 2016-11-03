import QtQuick 2.4
import QtQuick.Dialogs 1.2
import "../component/theme"
import "../component/view"

Dialog
{
    property var context

    id: contactsdialog
    title: qsTr("Contacts")
    width: 500
    height: 400

    contentItem: ContactList {
        id: lvcontacts
        anchors.fill: parent
        context: contactsdialog.context

        header: ThemeTextField {
            width: lvcontacts.width
            placeholderText: qsTr("Search...")
        }
    }
}
