import QtQuick 2.4
import "../"

MouseArea
{
    property bool canHighlight: false
    property alias text: txtname.text

    id: themelistmenuitem
    width: parent.width
    height: Theme.itemSizeSmall
    hoverEnabled: true

    onPositionChanged: {
        canHighlight = true;
    }

    onExited: {
        canHighlight = false;
    }

    ThemeFrame
    {
        color: canHighlight ? Theme.mainColor : Theme.backgroundColor

        anchors {
            fill: parent
            topMargin: -1
        }
    }

    Text {
        id: txtname
        color: canHighlight ? Theme.mainTextColor : Theme.textColor
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
