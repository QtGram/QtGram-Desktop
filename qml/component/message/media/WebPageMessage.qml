import QtQuick 2.4
import "../../message"

Column
{
    property var context
    property alias url: wpurl.rawText
    property alias title: wptitle.text
    property alias description: wpdescription.text
    property alias source: imgthumbnail.source

    id: webpageelement
    spacing: Theme.paddingSmall

    MessageText
    {
        id: wpurl
        emojiPath: context.qtgram.emojiPath
        width: parent.width
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
    }

    Row
    {
        id: preview
        width: parent.width
        height: previewcontent.height
        spacing: Theme.paddingSmall

        Rectangle
        {
            color: "green"
            width: Theme.paddingSmall
            height: parent.height
        }

        Column
        {
            id: previewcontent
            width: parent.width - (Theme.paddingSmall * 2)
            spacing: Theme.paddingMedium

            Text
            {
                id: wptitle
                width: parent.width
                wrapMode: Text.Wrap
                font { bold: true; pointSize: Theme.fontSizeMedium }
            }

            Text
            {
                id: wpdescription
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
