import QtQuick 2.4
import LibQTelegram 1.0
import "../../component"
import "../../component/theme"
import "../../component/message"
import "../../item"
import "../../js/Colors.js" as Colors

ViewContainer
{
    property Message selectedMessage: null
    property bool editMode: false
    property var dialog

    id: messagesview

    MessagesModel
    {
        id: messagesmodel
        telegram: messagesview.context.telegram
        dialog: messagesview.dialog
        isActive: Qt.application.state === Qt.ApplicationActive
    }

    DialogHeader
    {
        id: dialogheader
        width: parent.width
        context: messagesview.context
        dialog: messagesview.dialog
        title: messagesmodel.title
        statusText: messagesmodel.statusText
    }

    ThemeListView
    {
        id: lvmessages
        clip: true
        anchors { left: parent.left; top: dialogheader.bottom; right: parent.right; bottom: stickersbar.top }
        verticalLayoutDirection: ListView.BottomToTop
        cacheBuffer: parent.height * 2
        frameVisible: false
        spacing: Theme.paddingLarge
        model: messagesmodel

        Component.onCompleted: lvmessages.positionViewAtIndex(messagesmodel.newMessageIndex, ListView.Center);

        delegate: Column {
            width: lvmessages.width
            spacing: Theme.paddingSmall

            NewMessage { id: newmessage; visible: model.isMessageNew }

            Row {
                width: parent.width

                Item {
                    id: picontainer
                    height: peerimage.height

                    width: {
                        if(messagesmodel.isChat && !model.isMessageOut && !model.isMessageService)
                            return peerimage.size;

                        return 0;
                    }

                    PeerImage {
                        id: peerimage
                        size: Theme.itemSizeSmall
                        visible: model.needsPeerImage && !model.isMessageOut && messagesmodel.isChat
                        backgroundColor: Colors.getColor(model.item.fromId)
                        foregroundColor: "black"
                        fontPixelSize: Theme.fontSizeSmall
                        peer: model.needsPeerImage ? model.item : null
                    }
                }

                MessageModelItem {
                    width: parent.width - picontainer.width
                    maxWidth: width * 0.5
                    maxMediaWidth: 512
                    context: messagesview.context
                }
            }
        }

        FirstMessageButton { id: btnfirstmessage; flickable: lvmessages }
    }

    StickersBar
    {
        id: stickersbar
        model: context.stickers

        anchors {
            left: parent.left
            bottom: messagetextinput.top
            right: parent.right
        }

        onOpenStickers: {
            context.openStickers(stickerset, function(sticker) {
                messagesmodel.sendSticker(sticker);
            });
        }
    }

    MessageTextInput
    {
        id: messagetextinput
        visible: messagesmodel.isWritable

        anchors {
            left: parent.left
            bottom: parent.bottom
            right: parent.right
        }

        onStickersRequested: stickersbar.toggle()

        onSendRequested: {
            if(editMode) {
                messagesmodel.editMessage(content, selectedMessage);
                selectedMessage = null;
                editMode = false;
                return;
            }

            messagesmodel.sendMessage(content);
        }
    }
}
