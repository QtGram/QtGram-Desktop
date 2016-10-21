import QtQuick 2.0

ListView
{
    property alias placeholderText: txtplaceholder.text
    property alias frameVisible: frame.frameVisible

    id: themelistview
    currentIndex: -1

    ThemeFrame
    {
        id: frame
        anchors.fill: parent
        z: -1
    }

    Text
    {
        id: txtplaceholder
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: themelistview.count <= 0
        wrapMode: Text.Wrap
        color: Theme.placeholderTextColor
    }
}
