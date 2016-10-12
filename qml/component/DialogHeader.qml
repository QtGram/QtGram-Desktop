import QtQuick 2.4

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
        fallbackText: context.telegram.dialogTitle(tgDialog)
        peerImage: context.telegram.fileObject(tgDialog)
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
