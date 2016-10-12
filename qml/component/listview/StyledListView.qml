import QtQuick 2.0

ListView
{
    property color backgroundColor: "white"

    id: styledlistview
    highlight: Rectangle { color: "lightsteelblue" }
    currentIndex: -1

    Rectangle { anchors.fill: parent; color: styledlistview.backgroundColor; z: -1 }
}
