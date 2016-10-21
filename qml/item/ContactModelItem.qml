import QtQuick 2.4
import LibQTelegram 1.0

MouseArea
{
    property var context
    property bool highlighted: false

    id: contactmodelitem
    height: Theme.itemSizeSmall

    Rectangle
    {
        anchors.fill: parent
        color: Theme.mainColor
        visible: contactmodelitem.highlighted
    }

    PeerImage
    {
        id: peerimage
        anchors { left: parent.left; top: parent.top }
        size: contactmodelitem.height
        peer: model.item
        backgroundColor: "gray"
        foregroundColor: "black"
        fontPixelSize: Theme.fontSizeSmall
    }

    Text
    {
        id: lbluserfullname
        anchors { left: peerimage.right; top: parent.top; right: parent.right; leftMargin: Theme.paddingSmall }
        elide: Text.ElideRight
        text: model.fullName
        color: highlighted ? Theme.mainTextColor : Theme.textColor
    }

    Text
    {
        id: lblstatus
        anchors { left: peerimage.right; top: lbluserfullname.bottom; right: parent.right; bottom: parent.bottom; leftMargin: Theme.paddingSmall }
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
        font.pixelSize: lbluserfullname.font.pixelSize - 2
        color: highlighted ? Theme.mainTextColor : Theme.placeholderTextColor
        text: model.statusText
    }
}
