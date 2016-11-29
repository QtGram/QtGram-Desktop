import QtQuick 2.4
import LibQTelegram 1.0

StickerView
{
    property bool showThumbnail: false

    id: stickerimage

    delegate: Image {
        anchors.fill: parent
        source: stickerimage.showThumbnail ? stickerimage.thumbnail : stickerimage.source
        fillMode: Image.PreserveAspectFit
    }
}
