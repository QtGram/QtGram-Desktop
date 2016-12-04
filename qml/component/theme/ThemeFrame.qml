import QtQuick 2.4

Rectangle
{
    property bool frameVisible: true

    color: Theme.backgroundColor
    border { color: Theme.mainColor; width: frameVisible ? 1 : 0 }
    implicitWidth: Theme.defaultWidth
    implicitHeight: Theme.defaultHeight
}
