import QtQuick 2.4
import LibQTelegram 1.0

MouseArea
{
    property var context
    property var tgDialog

    id: dialogmodelitem
    height: Theme.itemSizeSmall

    PeerImage
    {
        id: peerimage
        anchors { left: parent.left; top: parent.top }
        size: dialogmodelitem.height
        backgroundColor: Theme.mainColor
        foregroundColor: Theme.mainTextColor
        fontPixelSize: Theme.fontSizeLarge
        peer: model.item
    }

    Text
    {
        id: lbltitle
        anchors { left: peerimage.right; top: parent.top; right: parent.right; leftMargin: Theme.paddingSmall }
        text: model.title
        elide: Text.ElideRight
    }

    Row
    {
        anchors { left: peerimage.right; top: lbltitle.bottom; bottom: parent.bottom; right: parent.right; leftMargin: Theme.paddingSmall }
        spacing: Theme.paddingSmall

        Text
        {
            id: lblfrom
            color: Theme.mainColor

            text: {
                if(model.topMessage)
                    return (model.topMessage.isOut ? qsTr("You") : model.topMessageFrom) + ":";

                return "";
            }

            visible: {
                if(model.draftMessage.length > 0 || model.isBroadcast || model.isTopMessageService)
                    return false;

                if(model.isChat || model.isMegaGroup)
                    return true;

                if(model.topMessage)
                    return model.isTopMessageOut;

                return false;
            }
        }

        Text
        {
            id: lbllastmessage
            width: parent.width - (lblfrom.visible ? lblfrom.contentWidth : 0)
            wrapMode: Text.NoWrap
            elide: Text.ElideRight
            verticalAlignment: Text.AlignHCenter
            color: model.isTopMessageService ? Theme.mainColor : Theme.placeholderTextColor
            font { italic: model.isTopMessageService }

            text: {
                var msg = "";

                if(model.draftMessage.length > 0)
                    msg = qsTr("Draft: %1").arg(model.draftMessage);
                else
                    msg = model.topMessageText;

                return msg;
            }
        }
    }
}
