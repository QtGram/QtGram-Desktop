import QtQuick 2.4
import LibQTelegram 1.0
import "../component/message"
import "../component/theme/listview"

ThemeListItem
{
    property var context

    id: dialogmodelitem
    contentHeight: Theme.itemSizeSmall

    menu: ThemeListMenu {
        ThemeListMenuItem {
            text: qsTr("Clear history")
            onClicked: context.dialogs.clearHistory(model.index)
        }

        ThemeListMenuItem {
            text: qsTr("Delete")
            onClicked: context.dialogs.removeDialog(model.index)
        }
    }

    PeerImage
    {
        id: peerimage
        anchors { left: parent.left; top: parent.top }
        size: dialogmodelitem.contentHeight
        backgroundColor: Theme.mainColor
        foregroundColor: Theme.mainTextColor
        fontPixelSize: Theme.fontSizeLarge
        peer: model.item
    }

    Row
    {
        id: headerrow
        anchors { left: peerimage.right; top: parent.top; right: parent.right; leftMargin: Theme.paddingSmall }
        height: lbltitle.contentHeight

        Text
        {
            id: lbltitle
            text: model.title
            elide: Text.ElideRight
            width: parent.width - lblstatus.contentWidth - Theme.paddingSmall
        }

        MessageStatus
        {
            id: lblstatus
            horizontalAlignment: Text.AlignRight
            visible: !model.isTopMessageService
            ticksColor: Theme.mainColor
            messageDate: model.topMessageDate
            isMessageOut: model.isTopMessageOut
            isMessageUnread: model.isTopMessageUnread
            dateFirst: false
        }
    }

    Row
    {
        anchors {
            left: peerimage.right
            top: headerrow.bottom
            bottom: parent.bottom
            right: parent.right
            leftMargin: Theme.paddingSmall
            rightMargin: Theme.paddingMedium
        }

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
                if((model.peerAction.length > 0) || (model.draftMessage.length > 0) || model.isBroadcast || model.isTopMessageService)
                    return false;

                if(model.isChat || model.isMegaGroup)
                    return true;

                if(model.topMessage)
                    return model.isTopMessageOut;

                return false;
            }
        }

        MessageText
        {
            id: lbllastmessage
            wrapMode: Text.NoWrap
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            color: model.isTopMessageService ? Theme.mainColor : Theme.placeholderTextColor
            font { italic: model.isTopMessageService }
            emojiPath: context.qtgram.emojiPath
            openUrls: false

            width: {
                var w = parent.width;

                if(lblfrom.visible)
                    w -= lblfrom.contentWidth + Theme.paddingSmall;

                if(rectunreadcount.visible)
                    w -= rectunreadcount.width + Theme.paddingSmall;

                return w;
            }

            rawText: {
                if(model.peerAction.length > 0)
                    return model.peerAction;

                var msg = "";

                if(model.draftMessage.length > 0)
                    msg = qsTr("Draft: %1").arg(model.draftMessage);
                else
                    msg = model.topMessageText;

                return msg;
            }
        }

        Rectangle
        {
            id: rectunreadcount
            width: parent.height
            height: parent.height
            color: Theme.mainColor
            radius: width * 0.5
            visible: model.unreadCount > 0

            Text {
                text: model.unreadCount
                color: Theme.mainTextColor
                anchors.centerIn: parent
                font.pointSize: Theme.fontSizeSmall
            }
        }
    }
}
