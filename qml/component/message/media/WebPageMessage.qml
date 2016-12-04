import QtQuick 2.4
import "../../message"
import "../.."

Column
{
    readonly property real calculatedWidth: Math.max(wpmessage.calculatedWidth,
                                                     wptitle.calculatedWidth,
                                                     wpdescription.calculatedWidth)

    property var context
    property alias messageText: wpmessage.rawText
    property alias title: wptitle.rawText
    property alias description: wpdescription.rawText
    property alias source: imgthumbnail.source
    property alias quoteColor: messagequote.color

    id: webpageelement
    spacing: Theme.paddingSmall

    MessageText
    {
        id: wpmessage
        emojiPath: context.qtgram.emojiPath
        width: parent.width
        wrapMode: Text.Wrap
    }

    Row
    {
        id: preview
        width: parent.width
        height: previewcontent.height
        spacing: Theme.paddingSmall

        MessageQuote { id: messagequote; height: parent.height }

        Column
        {
            id: previewcontent
            width: parent.width - (Theme.paddingSmall * 2)
            spacing: Theme.paddingMedium

            MessageText
            {
                id: wptitle
                emojiPath: context.qtgram.emojiPath
                visible: rawText.length > 0
                width: parent.width
                wrapMode: Text.Wrap
                font { bold: true; pointSize: Theme.fontSizeMedium }
            }

            MessageText
            {
                id: wpdescription
                emojiPath: context.qtgram.emojiPath
                visible: rawText.length > 0
                width: parent.width
                wrapMode: Text.Wrap
                font { pointSize: Theme.fontSizeSmall; italic: true }
            }

            BlurredImage
            {
                id: imgthumbnail
                width: parent.width
                height: mediamessageitem.webPageThumbnailHeight
            }
        }
    }
}
