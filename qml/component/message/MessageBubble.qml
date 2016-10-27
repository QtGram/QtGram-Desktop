import QtQuick 2.4
import LibQTelegram 1.0

Item
{
    property Message tgMessage

    id: messagebubble
    layer.enabled: true
    opacity: 0.80

    Rectangle
    {
        id: mainbubble
        color: tgMessage.isOut ? Theme.alternateMainColor : Theme.mainColor
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
            top: !tgMessage.isOut ? undefined : parent.top
            right: !tgMessage.isOut ? undefined : parent.right
            bottom: tgMessage.isOut ? undefined: parent.bottom
            left: tgMessage.isOut ? undefined : parent.left
        }
    }
}
