import QtQuick 2.4
import LibQTelegram 1.0
import "../component/message"
import "../component/message/media"

Item
{
    property var context
    property real maxWidth

    id: messagemodelitem
    height: content.height

    width: {
        if(model.isMessageService)
            return maxWidth;

        var w = Math.max(lblhiddenfrom.contentWidth, lblhiddenmessage.contentWidth, mediamessageitem.contentWidth)
        return Math.min(w, maxWidth);
    }

    anchors {
        right: !model.isMessageOut ? undefined : parent.right
        left: model.isMessageOut ? undefined : parent.left
        rightMargin: Theme.paddingMedium
        leftMargin: Theme.paddingMedium
    }

    MessageBubble
    {
        anchors { fill: parent; margins: -Theme.paddingSmall }
        tgMessage: model.item

        visible: {
            if(mediamessageitem.isSticker || mediamessageitem.isAnimated)
                return false;

            return !model.isMessageService;
        }
    }

    Column
    {
        id: content
        width: parent.width

        Text { id: lblhiddenfrom; text: model.messageFrom; visible: false }
        Text { id: lblhiddenmessage; text: model.messageText; visible: false }

        Text
        {
            id: lblfrom
            width: parent.width
            horizontalAlignment: Text.AlignLeft
            visible: messagesmodel.isChat && !model.isMessageOut && !model.isMessageService
            text: lblhiddenfrom.text
        }

        MediaMessageItem
        {
            id: mediamessageitem
            message: model.item
            size: parent.width

            imageDelegate: ImageMessage {
                anchors.fill: parent
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
                width: parent.width
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
            width: parent.width
            emojiPath: context.qtgram.emojiPath
            rawText: lblhiddenmessage.text
            wrapMode: Text.Wrap
            font { italic: model.isMessageService }

            color: {
                if(model.isMessageService)
                    return "gray";

                return "black";
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
            messageDate: model.messageDate
        }
    }
}
