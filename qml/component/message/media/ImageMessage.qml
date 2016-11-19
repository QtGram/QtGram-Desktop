import QtQuick 2.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

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
    MouseArea { anchors.fill: parent; onClicked: mediamessageitem.download() }

    ProgressBar
    {
        x: Theme.paddingMedium
        width: parent.width - (x * 2)
        anchors.verticalCenter: parent.verticalCenter
        visible: mediamessageitem.uploading
        value: mediamessageitem.progress
        minimumValue: 0.0
        maximumValue: 1.0
    }
}
