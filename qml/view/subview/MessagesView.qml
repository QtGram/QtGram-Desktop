import QtQuick 2.4
import LibQTelegram 1.0
import "../../component"
import "../../component/listview"
import "../../item"

ViewContainer
{
    property var tgDialog

    id: messagesview

    MessagesModel
    {
        id: messagesmodel
        telegram: messagesview.context.telegram
        dialog: messagesview.tgDialog
    }

    DialogHeader
    {
        id: dialogheader
        width: parent.width
        context: messagesview.context
        tgDialog: messagesview.tgDialog
        title: messagesmodel.title
        statusText: messagesmodel.statusText
    }

    StyledListView
    {
        id: lvmessages
        clip: true
        anchors { left: parent.left; top: dialogheader.bottom; right: parent.right; bottom: tisendmessage.top }
        verticalLayoutDirection: ListView.BottomToTop
        backgroundColor: "aliceblue"
        spacing: Theme.paddingLarge
        model: messagesmodel

        delegate: MessageModelItem {
            maxWidth: parent.width * 0.5
            context: messagesview.context
        }
    }

    StyledTextInput
    {
        id: tisendmessage
        anchors { left: parent.left; bottom: parent.bottom; right: parent.right }
        placeholderText: qsTr("Send message...")

        onReturnPressed: {
            messagesmodel.sendMessage(tisendmessage.text);
            tisendmessage.text = "";
        }
    }
}
