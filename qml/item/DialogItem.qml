import QtQuick 2.4
import LibQTelegram 1.0
import "../js/TelegramHelper.js" as TelegramHelper

MouseArea
{
    property var context
    property var tgDialog
    property Message tgMessage: context.telegram.message(tgDialog.topMessage)

    id: dialogitem
    height: Theme.itemSizeSmall

    PeerImage
    {
        id: peerimage
        anchors { left: parent.left; top: parent.top }
        size: dialogitem.height
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

    Row
    {
        anchors { left: peerimage.right; top: lbltitle.bottom; bottom: parent.bottom; right: parent.right; leftMargin: Theme.paddingSmall }
        spacing: Theme.paddingSmall

        Text
        {
            id: lblfrom
            color: Theme.highlightColor

            text: {
                if(tgMessage)
                    return (tgMessage.isOut ? qsTr("You") : context.telegram.messageFrom(tgMessage)) + ":";

                return "";
            }

            visible: {
                if(context.telegram.dialogIsBroadcast(tgDialog))
                    return false;

                if(context.telegram.dialogIsChat(tgDialog) || context.telegram.dialogIsChannel(tgDialog))
                    return true;

                if(tgMessage)
                    return tgMessage.isOut;

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

                if(context.telegram.dialogHasDraftMessage(tgDialog))
                    msg = qsTr("Draft: %1").arg(context.telegram.dialogDraftMessage(tgDialog));
                else
                    msg = context.telegram.messagePreview(tgMessage);

                return TelegramHelper.firstMessageLine(msg);
            }
        }
    }
}
