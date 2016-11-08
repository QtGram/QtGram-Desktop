import QtQuick 2.4
import "../theme"

ThemeFrame
{
    id: newmessage
    x: -1
    width: parent.width + 2
    height: visible ? txt.contentHeight : 0

    Text {
        id: txt
        text: qsTr("%1   New message(s)   %1").arg("↓")
        width: parent.width
        color: Theme.mainColor
        font.pointSize: Theme.fontSizeMedium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
