import QtQuick 2.4
import LibQTelegram 1.0

Rectangle
{
    property var context
    property var tgDialog
    property alias title: lbltitle.text
    property alias statusText: lblstatus.text

    id: dialogheader
    height: Theme.itemSizeSmall - 1
    color: Theme.mainColor

    Text
    {
        id: lbltitle
        anchors { left: parent.left; top: parent.top; right: peerimage.left; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
        verticalAlignment: Text.AlignVCenter
        font.bold: true
        color: Theme.mainTextColor
        elide: Text.ElideRight
    }

    Text
    {
        id: lblstatus
        anchors { left: parent.left; top: lbltitle.bottom; right: peerimage.left; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
        verticalAlignment: Text.AlignVCenter
        font.pointSize: Theme.fontSizeSmall
        color: Theme.mainTextColor
        elide: Text.ElideRight
    }

    PeerImage
    {
        id: peerimage
        anchors { top: parent.top; right: parent.right; rightMargin: Theme.paddingSmall }
        size: dialogheader.height
        peer: tgDialog
        backgroundColor: "gray"
        foregroundColor: "black"
        fontPixelSize: Theme.fontSizeSmall
    }
}
