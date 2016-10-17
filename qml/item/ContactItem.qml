import QtQuick 2.4
import LibQTelegram 1.0
import "../js/TelegramHelper.js" as TelegramHelper

Item
{
    property var context
    property var tgUser

    id: contactitem
    height: 32

    PeerImage
    {
        id: peerimage
        anchors { left: parent.left; top: parent.top }
        size: contactitem.height
        peer: tgUser
        backgroundColor: "gray"
        foregroundColor: "black"
        fontPixelSize: Theme.fontSizeSmall
    }

    Text
    {
        id: lbltitle
        anchors { left: peerimage.right; top: parent.top; right: parent.right; leftMargin: Theme.paddingSmall }
        text: context.telegram.userFullName(tgUser)
        elide: Text.ElideRight
    }

    Text
    {
        id: lblstatus
        anchors { left: peerimage.right; top: lbltitle.bottom; right: parent.right; bottom: parent.bottom; leftMargin: Theme.paddingSmall }
        text: context.telegram.userStatusText(tgUser)
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
        font.pixelSize: lbltitle.font.pixelSize - 2
        color: "gray"
    }
}
