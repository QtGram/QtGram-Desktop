import QtQuick 2.4
import LibQTelegram 1.0

Item
{
    property var context
    property var tgDialog

    id: dialogheader
    height: Theme.itemSizeSmall

    PeerImage
    {
        id: peerimage
        anchors { left: parent.left; top: parent.top }
        size: dialogheader.height
        peer: tgDialog
        backgroundColor: "gray"
        foregroundColor: "black"
        fontPixelSize: Theme.fontSizeSmall
    }

    Text
    {
        id: lbltitle
        anchors { left: peerimage.right; top: parent.top; right: parent.right; leftMargin: Theme.paddingSmall }
        text: context.telegram.dialogTitle(tgDialog)
        elide: Text.ElideRight
    }

    Text
    {
        id: lblstatus
        anchors { left: peerimage.right; top: lbltitle.bottom; right: parent.right; leftMargin: Theme.paddingSmall }
        text: context.telegram.dialogStatusText(tgDialog)
        font.pointSize: Theme.fontSizeSmall
        elide: Text.ElideRight
    }
}
