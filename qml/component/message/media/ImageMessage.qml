import QtQuick 2.4
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
    }

    CircularProgressBar
    {
        anchors.centerIn: parent
        visible: mediamessageitem.uploading
        progress: mediamessageitem.progress
        rotating: visible
    }
}
