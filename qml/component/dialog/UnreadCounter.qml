import QtQuick 2.4

Rectangle
{
    property bool alternateColor
    property int unreadCount: 0
    property real size

    id: unreadcounter
    width: size
    height: size
    color: alternateColor ? Theme.alternateMainColor : Theme.mainColor
    radius: width * 0.5
    visible: unreadCount > 0

    Text {
        text: unreadCount
        color: Theme.mainTextColor
        anchors.centerIn: parent
        font { bold: true; pointSize: Theme.fontSizeSmall }
    }
}
