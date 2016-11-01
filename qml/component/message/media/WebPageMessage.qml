import QtQuick 2.4
import "../../message"

Column
{
    readonly property real calculatedWidth: Math.max(wpurl.calculatedWidth,
                                                     wptitle.calculatedWidth,
                                                     wpdescription.calculatedWidth,
                                                     imgthumbnail.sourceSize.width)

    property var context
    property alias url: wpurl.rawText
    property alias title: wptitle.rawText
    property alias description: wpdescription.rawText
    property alias source: imgthumbnail.source
    property alias quoteColor: quoterect.color

    id: webpageelement
    spacing: Theme.paddingSmall

    MessageText
    {
        id: wpurl
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

        Rectangle
        {
            id: quoterect
            width: Theme.paddingSmall
            height: parent.height
        }

        Column
        {
            id: previewcontent
            width: parent.width - (Theme.paddingSmall * 2)
            spacing: Theme.paddingMedium

            MessageText
            {
                id: wptitle
                emojiPath: context.qtgram.emojiPath
                width: parent.width
                wrapMode: Text.Wrap
                font { bold: true; pointSize: Theme.fontSizeMedium }
            }

            MessageText
            {
                id: wpdescription
                emojiPath: context.qtgram.emojiPath
                width: parent.width
                wrapMode: Text.Wrap
                font { pointSize: Theme.fontSizeSmall; italic: true }
            }

            Image
            {
                id: imgthumbnail
                width: parent.width
                asynchronous: true
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
