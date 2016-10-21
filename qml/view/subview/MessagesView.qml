import QtQuick 2.4
import LibQTelegram 1.0
import "../../component"
import "../../component/theme"
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

    ThemeListView
    {
        id: lvmessages
        clip: true
        anchors { left: parent.left; top: dialogheader.bottom; right: parent.right; bottom: tisendmessage.top }
        verticalLayoutDirection: ListView.BottomToTop
        frameVisible: false
        spacing: Theme.paddingLarge
        model: messagesmodel

        onAtYBeginningChanged: {
            if(!atYBeginning)
                return;

            messagesmodel.loadMore();
        }

        delegate: MessageModelItem {
            maxWidth: parent.width * 0.5
            context: messagesview.context
        }
    }

    ThemeTextField
    {
        id: tisendmessage
        placeholderText: qsTr("Send message...")

        anchors {
            left: parent.left
            bottom: parent.bottom
            right: parent.right
            leftMargin: -1
            rightMargin: -1
        }

        onReturnPressed: {
            messagesmodel.sendMessage(tisendmessage.text);
            tisendmessage.text = "";
        }
    }
}
