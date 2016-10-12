import QtQuick 2.4
import QtGraphicalEffects 1.0

Item
{
    property alias source: tlimage.source

    id: roundedimage

    Image
    {
        id: tlimage
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    Rectangle
    {
        id: mask
        anchors.fill: parent
        radius: width * 0.5
        visible: false
        color: "black"
    }

    OpacityMask
    {
        anchors.fill: mask
        source: tlimage
        maskSource: mask
    }
}
