import QtQuick 2.4
import LibQTelegram 1.0
import "../../component"
import "../../component/theme"
import "../../component/message"
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
        anchors { left: parent.left; top: dialogheader.bottom; right: parent.right; bottom: messagetextinput.top }
        verticalLayoutDirection: ListView.BottomToTop
        cacheBuffer: messagesmodel.loadCount
        frameVisible: false
        spacing: Theme.paddingLarge
        model: messagesmodel

        onAtYBeginningChanged: {
            if(!atYBeginning)
                return;

            messagesmodel.loadHistory();
        }

        onAtYEndChanged: {
            if(!atYEnd)
                return;

            messagesmodel.loadMore();
        }

        delegate: MessageModelItem {
            width: parent.width
            maxWidth: parent.width * 0.5
            context: messagesview.context
        }
    }

    MessageTextInput
    {
        id: messagetextinput
        visible: messagesmodel.isWritable

        anchors {
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }

        onSendRequested: messagesmodel.sendMessage(content)
    }
}
