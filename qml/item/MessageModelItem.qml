import QtQuick 2.4
import LibQTelegram 1.0
import "../component/theme"
import "../component/theme/listview"
import "../component/message"
import "../component/message/reply"
import "../component/message/media"
import "../js/Colors.js" as Colors

ThemeListItem
{
    property var context
    property real maxWidth
    property real maxMediaWidth

    id: messagemodelitem
    contentHeight: content.height + Theme.paddingMedium

    menu: ThemeListMenu {
        ThemeListMenuItem {
            text: qsTr("Reply")
        }

        ThemeListMenuItem {
            text: qsTr("Edit")
            visible: model.isMessageOut

            onClicked: {
                messagesview.selectedMessage = model.item;
                messagesview.editMode = true;

                messagetextinput.editMessage(model.messageText);

            }
        }
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

    Column
    {
        id: content

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
            rawText: model.isMessageForwarded ? qsTr("Forwarded from %1").arg(model.forwardedFromName) : model.messageFrom
            color: model.isMessageForwarded ? Colors.getColor(model.forwardedFromUser.id) : Colors.getColor(model.item.fromId)
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

            audioDelegate: AudioMessage {
                width: Math.min(contentWidth, maxWidth)
                duration: mediamessageitem.duration
                barColor: model.isMessageOut ? Theme.mainColor : Theme.alternateMainColor
                source: model.item
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
