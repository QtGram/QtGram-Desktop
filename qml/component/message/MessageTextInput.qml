import QtQuick 2.0
import "../theme"

Item
{
    signal sendRequested(string content)

    id: messagetextinput
    height: Theme.defaultHeight

    ThemeTextField
    {
        id: tisendmessage
        placeholderText: qsTr("Send message...")

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            right: btnsend.left
            leftMargin: -1
            rightMargin: -1
        }

        onReturnPressed: {
            messagetextinput.sendRequested(tisendmessage.text);
            tisendmessage.text = "";
        }
    }

    ThemeButton
    {
        id: btnsend
        width: Theme.itemSizeMedium
        text: "❯❯"

        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }

        onClicked: messagetextinput.sendRequested()
    }
}
