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
        peer: model.item
        backgroundColor: "gray"
        foregroundColor: "black"
        fontPixelSize: Theme.fontSizeSmall
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
                    return (model.topMessage.isOut ? qsTr("You") : model.topMessageFrom);

                return "";
            }

            visible: {
                if(model.isBroadcast)
                    return false;

                if(model.isChat || model.isMegaGroup)
                    return true;

                if(model.topMessage)
                    return model.topMessage.isOut;

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
            color: "gray"

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
