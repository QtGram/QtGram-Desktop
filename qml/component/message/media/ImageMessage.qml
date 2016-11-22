import QtQuick 2.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import ".."

Item
{
    property alias source: image.source
    property bool needsBlur: false

    id: imagemessage

    Image
    {
        id: image
        anchors.fill: parent
        asynchronous: true
    }

    FastBlur
    {
        anchors.fill: image
        source: image
        radius: needsBlur ? 32.0 : 0.0
        visible: needsBlur
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
