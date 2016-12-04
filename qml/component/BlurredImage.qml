import QtQuick 2.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0

Image
{
    property bool needsBlur: false

    id: blurredimage
    asynchronous: true
    fillMode: Image.PreserveAspectFit

    layer.enabled: !mediamessageitem.downloaded

    layer.effect: FastBlur {
        width: blurredimage.width
        height: blurredimage.height
        radius: 32.0
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
}
