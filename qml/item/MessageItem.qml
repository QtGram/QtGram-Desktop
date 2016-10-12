import QtQuick 2.4
import LibQTelegram 1.0
import "../component/message"

Item
{
    property var context
    property var tgDialog
    property Message tgMessage
    property real maxWidth

    property FileObject foImage: {
        if(context.telegram.messageHasImage(tgMessage))
            return context.telegram.fileObject(tgMessage);

        return null;
    }

    id: messageitem
    height: content.height

    width: {
        var w = Math.max(lblhiddenfrom.contentWidth, lblhiddenmessage.contentWidth);

        if(foImage)
            w = Math.max(w, foImage.imageSize.width);

        return Math.min(w, maxWidth);
    }

    anchors {
        right: tgMessage.isOut ? undefined : parent.right
        left: !tgMessage.isOut ? undefined : parent.left
        rightMargin: Theme.paddingMedium
        leftMargin: Theme.paddingMedium
    }

    MessageBubble
    {
        anchors { fill: parent; margins: -Theme.paddingSmall }
        tgMessage: messageitem.tgMessage
    }

    Column
    {
        id: content
        width: parent.width

        Text { id: lblhiddenfrom; text: context.telegram.messageFrom(tgMessage); visible: false }
        Text { id: lblhiddenmessage; text: context.telegram.messageText(tgMessage); visible: false }

        Text
        {
            id: lblfrom
            width: parent.width
            horizontalAlignment: Text.AlignLeft
            visible: context.telegram.dialogIsChat(tgDialog) && !tgMessage.isOut
            text: lblhiddenfrom.text
        }

        MessageImage
        {
            id: miimage
            size: parent.width
            context: messageitem.context
            tgMessage: messageitem.tgMessage
        }

        Text
        {
            id: lblmessage
            width: parent.width
            horizontalAlignment: tgMessage.isOut ? Text.AlignRight : Text.AlignLeft
            text: lblhiddenmessage.text
        }
    }
}
