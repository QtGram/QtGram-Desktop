import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0
import "../theme"

Item
{
    property Message replyMessage: null

    signal sendRequested(string content, var replymessage)
    signal stickersRequested()

    function editMessage(messagetext) {
        tisendmessage.text = messagetext;
        tisendmessage.focusTextInput();
    }

    id: messagetextinput
    height: visible ? Theme.defaultHeight : 0

    FileDialog
    {
        id: filedialog
        title: qsTr("Send file...")
        onAccepted: messagesmodel.sendFile(filedialog.fileUrl, tisendmessage.text);
    }

    ThemeButton
    {
        id: btnattach
        width: parent.height
        image: "qrc:///res/attach.png"

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        onClicked: filedialog.open()
    }

    ThemeButton
    {
        id: btnstickers
        width: parent.height
        image: "qrc:///res/sticker.png"

        anchors {
            left: btnattach.right
            top: parent.top
            bottom: parent.bottom
        }

        onClicked: stickersRequested()
    }

    ThemeTextField
    {
        id: tisendmessage
        placeholderText: qsTr("Send message...")

        anchors {
            left: btnstickers.right
            top: parent.top
            bottom: parent.bottom
            right: btnsend.left
            leftMargin: -1
            rightMargin: -1
        }

        onTextChanged: {
            if(text.length < 2)
                return

            messagesmodel.sendAction(MessagesModel.TypingAction);
        }

        onReturnPressed: {
            messagetextinput.sendRequested(tisendmessage.text, replyMessage);
            tisendmessage.text = "";
            replyMessage = null;
        }
    }

    ThemeButton
    {
        id: btnsend
        alternateColor: true
        width: Theme.itemSizeMedium
        enabled: tisendmessage.text.length > 0
        text: "❯❯"

        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }

        onClicked: {
            messagetextinput.sendRequested(tisendmessage.text, replyMessage);
            tisendmessage.text = "";
            replyMessage = NULL;
        }
    }
}
