import QtQuick 2.4

Rectangle
{
    property Flickable flickable

    id: firstmessagebutton
    height: Theme.itemSizeSmall
    width: height
    radius: width / 2
    anchors { right: parent.right; bottom: parent.bottom; margins: Theme.paddingMedium }
    opacity: flickable.contentY - flickable.originY < flickable.contentHeight - flickable.height * 1.5 ? 1 : 0

    color: {
        var color = Qt.rgba(Theme.placeholderTextColor.r, Theme.placeholderTextColor.g, Theme.placeholderTextColor.b, .3);

        if(mousearea.containsMouse)
            return Qt.darker(color, Theme.colorSweep);

        return color;
    }

    Behavior on opacity { NumberAnimation { duration: 200 } }

    Text {
        anchors.centerIn: parent
        text: "⇓"
        font.pixelSize: parent.height / 2
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: Theme.mainColor
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: flickable.positionViewAtIndex(0, ListView.bottom)
    }
}
