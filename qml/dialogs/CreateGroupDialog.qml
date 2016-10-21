import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import "../component"

Dialog
{
    property var context
    property bool isChannel: false

    id: creategroupdialog
    title: isChannel ? qsTr("Create channel...") : qsTr("Create group...")

    contentItem: Item {
        implicitWidth: 400
        implicitHeight: 500 + Theme.paddingLarge

        StyledListView {
            id: lvcontacts
            anchors.fill: parent
            placeholderText: qsTr("Contact list is empty")

            header: StyledTextInput {
                width: parent.width
                placeholderText: qsTr("Name...")
            }
        }
    }
}
