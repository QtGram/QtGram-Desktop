import QtQuick 2.4
import "../../js/TextElaborator.js" as TextElaborator

Text
{
    readonly property real calculatedWidth: txthidden.contentWidth
    property bool openUrls: true
    property string emojiPath
    property string rawText

    Text { id: txthidden; visible: false; text: messagetext.text; font: messagetext.font; wrapMode: Text.NoWrap }

    id: messagetext
    textFormat: Text.StyledText
    text: TextElaborator.elaborate(rawText, emojiPath, font.pixelSize, "#888888", openUrls)
    verticalAlignment: Text.AlignTop

    onLinkActivated: {
        if(!openUrls)
            return;

        Qt.openUrlExternally(link);
    }
}
