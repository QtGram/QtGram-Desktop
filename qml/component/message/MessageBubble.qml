import QtQuick 2.4
import LibQTelegram 1.0

Item
{
    id: messagebubble
    layer.enabled: true
    opacity: 0.80

    Rectangle
    {
        id: mainbubble
        color: model.isMessageOut ? Theme.alternateMainColor : Theme.mainColor
        anchors.fill: parent
        radius: 12
        smooth: true
    }

    Rectangle
    {
        id: flatangle
        width: mainbubble.radius
        height: mainbubble.radius
        color: mainbubble.color

        anchors {
            top: !model.isMessageOut ? undefined : parent.top
            right: !model.isMessageOut ? undefined : parent.right
            bottom: model.isMessageOut ? undefined: parent.bottom
            left: model.isMessageOut ? undefined : parent.left
        }
    }
}
