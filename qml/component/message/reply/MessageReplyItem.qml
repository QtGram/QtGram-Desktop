import QtQuick 2.4
import LibQTelegram 1.0
import "../"

Item
{
    readonly property real calculatedWidth: Math.max(lblfrom.calculatedWidth,
                                                     mediamessageitem.contentWidth,
                                                     lblmessage.calculatedWidth)

    property alias quoteColor: messagequote.color
    property alias fromColor: lblfrom.color

    id: messagereplyitem
    height: Math.max(previewcontent.height, mediamessageitem.height)

    Row
    {
        id: row
        width: parent.width
        height: parent.height
        spacing: Theme.paddingSmall

        MessageQuote { id: messagequote; height: parent.height }

        MediaMessageItem
        {
            id: mediamessageitem
            message: model.messageHasReply ? model.replyItem : null
            size: parent.width

            imageDelegate: MessageReplyImage {
                anchors.fill: parent
                source: mediamessageitem.source
            }
        }

        Column
        {
            id: previewcontent
            width: parent.width

            MessageText
            {
                id: lblfrom
                font.bold: true
                emojiPath: context.qtgram.emojiPath
                width: parent.width - Theme.paddingSmall
                horizontalAlignment: Text.AlignLeft
                visible: messagesmodel.isChat && !model.isMessageOut && !model.isMessageService
                rawText: model.replyFrom
            }

            MessageText
            {
                id: lblmessage
                width: parent.width - Theme.paddingSmall
                font { italic: true; pointSize: Theme.fontSizeSmall }
                emojiPath: context.qtgram.emojiPath
                rawText: model.replyText
                maximumLineCount: 3
                wrapMode: Text.Wrap
                elide: Text.ElideRight
                color: Theme.textColor
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}
