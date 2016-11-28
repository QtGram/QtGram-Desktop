import QtQuick 2.4
import QtGraphicalEffects 1.0

Item
{
    property alias source: image.source
    property alias sourceSize: image.sourceSize
    property bool needsBlur: false

    Image
    {
        id: image
        anchors.fill: parent
        asynchronous: true
        fillMode: Image.PreserveAspectFit
    }

    FastBlur
    {
        anchors.fill: image
        source: image
        radius: needsBlur ? 32.0 : 0.0
        visible: needsBlur
    }
}
