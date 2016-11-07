import QtQuick 2.4
import LibQTelegram 1.0
import "../component/theme"
import "../component/message"
import "../component/message/reply"
import "../component/message/media"
import "../js/Colors.js" as Colors

Item
{
    property var context
    property real maxWidth
    property real maxMediaWidth

    id: messagemodelitem

    height: {
        var h = content.height;

        if(newmessageframe.visible)
            h += newmessageframe.height

        return h;
    }

    MessageBubble
    {
        anchors { fill: content; leftMargin: -Theme.paddingSmall; rightMargin: -Theme.paddingSmall}
        message: model.item

        visible: {
            if(mediamessageitem.isSticker || mediamessageitem.isAnimated)
                return false;

            return !model.isMessageService;
        }
    }

    ThemeFrame
    {
        id: newmessageframe
        x: -1
        width: parent.width + 2
        visible: model.isMessageNew
        height: model.isMessageNew ? Theme.paddingLarge : 0

        Text {
            text: qsTr("New messages")
            width: parent.width
            color: Theme.mainColor
            font.pointSize: Theme.fontSizeSmall
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Column
    {
        id: content
        anchors { top: newmessageframe.bottom; topMargin: newmessageframe.visible ? Theme.paddingSmall : 0 }

        width: {
            if(model.isMessageService)
                return maxWidth;

            var w = Math.max(messagereply.calculatedWidth,
                             lblfrom.calculatedWidth,
                             lblmessage.calculatedWidth,
                             mediamessageitem.contentWidth,
                             messagestatus.contentWidth);

            if(model.isMessageMedia)
                return Math.min(w, maxMediaWidth, maxWidth);

            return Math.min(w, maxWidth);
        }

        anchors {
            right: !model.isMessageOut ? undefined : parent.right
            left: model.isMessageOut ? undefined : parent.left
            rightMargin: Theme.paddingMedium
            leftMargin: Theme.paddingMedium
        }

        MessageText
        {
            id: lblfrom
            visible: !model.isMessageService
            font.bold: true
            emojiPath: context.qtgram.emojiPath
            width: parent.width
            horizontalAlignment: Text.AlignLeft
            rawText: model.messageFrom
            color: Colors.getColor(model.item.fromId)
        }

        MessageReplyItem
        {
            id: messagereply
            width: parent.width
            quoteColor: model.isMessageOut ? Theme.mainColor : Theme.alternateMainColor
            fromColor: model.messageHasReply ? Colors.getColor(model.replyItem.fromId) : "black"
            visible: model.messageHasReply
        }

        MediaMessageItem
        {
            id: mediamessageitem
            message: model.item
            size: parent.width

            imageDelegate: ImageMessage {
                anchors.fill: parent
                needsBlur: !mediamessageitem.downloaded
                source: mediamessageitem.source
            }

            animatedDelegate: AnimatedMessage {
                anchors.fill: parent
                source: mediamessageitem.source
            }

            locationDelegate: LocationMessage {
                title: mediamessageitem.venueTitle
                address: mediamessageitem.venueAddress

                source: {
                    return context.locationThumbnail(mediamessageitem.geoPoint.latitude,
                                                     mediamessageitem.geoPoint.longitude,
                                                     maxWidth, maxWidth, 14)
                }
            }

            webPageDelegate: WebPageMessage {
                width: Math.min(calculatedWidth, maxWidth)
                quoteColor: model.isMessageOut ? Theme.mainColor : Theme.alternateMainColor
                context: messagemodelitem.context
                title: mediamessageitem.webPageTitle
                description: mediamessageitem.webPageDescription
                url: mediamessageitem.webPageUrl
                source: mediamessageitem.source
            }

            fileDelegate: FileMessage {
                width: Math.min(contentWidth, maxWidth)
                fileName: mediamessageitem.fileName
                fileSize: mediamessageitem.fileSize
            }
        }

        MessageText
        {
            id: lblmessage
            emojiPath: context.qtgram.emojiPath
            width: parent.width
            rawText: model.messageText
            wrapMode: Text.Wrap
            font { italic: model.isMessageService }

            color: {
                if(model.isMessageService)
                    return Theme.placeholderTextColor;

                return Theme.textColor;
            }

            horizontalAlignment: {
                if(model.isMessageService)
                    return Text.AlignHCenter;

                return Text.AlignLeft;
            }
        }

        MessageStatus
        {
            id: messagestatus
            width: parent.width
            visible: !model.isMessageService
            horizontalAlignment: Text.AlignRight
            isMessageOut: model.isMessageOut
            isMessageUnread: model.isMessageUnread
            isMessageEdited: model.isMessageEdited
            messageDate: model.messageDate
        }
    }
}
