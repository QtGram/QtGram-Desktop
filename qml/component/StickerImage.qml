import QtQuick 2.4
import QtQuick.Controls 1.4
import LibQTelegram 1.0

StickerView
{
    property bool showThumbnail: false

    id: stickerimage

    BusyIndicator
    {
        anchors.centerIn: parent
        running: stickerimage.downloading
    }

    delegate: Image {
        anchors.fill: parent
        source: parent.showThumbnail ? parent.thumbnail : parent.source
        fillMode: Image.PreserveAspectFit
    }
}
