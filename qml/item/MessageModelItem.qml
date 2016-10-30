import QtQuick 2.4
import LibQTelegram 1.0
import "../component/theme"
import "../component/message"
import "../component/message/media"

Item
{
    property var context
    property real maxWidth

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
        tgMessage: model.item

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

            var w = Math.max(lblhiddenfrom.contentWidth, lblhiddenmessage.contentWidth, mediamessageitem.contentWidth, messagestatus.contentWidth);
            return Math.min(w, maxWidth);
        }

        anchors {
            right: !model.isMessageOut ? undefined : parent.right
            left: model.isMessageOut ? undefined : parent.left
            rightMargin: Theme.paddingMedium
            leftMargin: Theme.paddingMedium
        }

        MessageText { id: lblhiddenfrom;  emojiPath: context.qtgram.emojiPath; rawText: model.messageFrom; visible: false }
        MessageText { id: lblhiddenmessage; emojiPath: context.qtgram.emojiPath; rawText: model.messageText; visible: false }

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
                width: parent.width
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

        Text
        {
            id: lblmessage
            width: parent.width
            text: lblhiddenmessage.text
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
