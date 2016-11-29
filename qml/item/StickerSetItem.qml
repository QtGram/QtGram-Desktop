import QtQuick 2.4
import LibQTelegram 1.0
import "../component"

MouseArea
{
    id: stickersetitem

    StickerImage
    {
        id: stickerimage
        width: parent.height
        sticker: model.stickerPreview
        showThumbnail: true

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    Text
    {
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        text: model.title

        anchors {
            left: stickerimage.right
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            leftMargin: Theme.paddingSmall
        }
    }
}
