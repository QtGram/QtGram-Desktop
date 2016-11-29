import QtQuick 2.4
import LibQTelegram 1.0
import "../component"

Row
{
    id: stickersetitem
    spacing: Theme.paddingMedium

    StickerImage
    {
        id: stickerimage
        width: parent.height
        height: parent.height
        sticker: model.stickerPreview
        showThumbnail: true
    }

    Text
    {
        width: parent.width - stickerimage.width
        height: parent.height
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        text: model.title
    }
}
