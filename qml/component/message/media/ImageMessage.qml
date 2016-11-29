import QtQuick 2.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import ".."
import "../.."

Item
{
    property alias source: image.source

    id: imagemessage

    BlurredImage
    {
        id: image
        anchors.fill: parent
        needsBlur: !mediamessageitem.isSticker && !mediamessageitem.downloaded
    }

    BusyIndicator { z: 2; anchors.centerIn: parent; running: mediamessageitem.downloading }

    MouseArea
    {
        anchors.fill: parent

        onClicked: {
            if(mediamessageitem.downloaded) {
                Qt.openUrlExternally("file://" + mediamessageitem.source);
                return;
            }

            mediamessageitem.download();
        }
    }

    CircularProgressBar
    {
        anchors.centerIn: parent
        visible: mediamessageitem.uploading
        progress: mediamessageitem.progress
        rotating: visible
    }
}
