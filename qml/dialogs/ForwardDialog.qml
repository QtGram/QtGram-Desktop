import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../component/theme"
import "../component"

Dialog
{
    property var context
    property var fromDialog

    signal forwardDialogSelected(var dialog)

    id: forwarddialog
    title: qsTr("Forward Message(s)")
    width: 500
    height: 400

    LibQTelegram.ForwardDialogsModel {
        id: forwarddialogsmodel
        telegram: context.telegram
        fromDialog: forwarddialog.fromDialog
    }

    contentItem: ThemeListView {
        id: lvdialogs
        anchors.fill: parent
        spacing: Theme.paddingSmall
        model: forwarddialogsmodel

        delegate: MouseArea {
            width: parent.width
            height: Theme.itemSizeSmall

            onClicked: {
                forwardDialogSelected(model.item);
                forwarddialog.close();
            }

            PeerImage {
                id: peerimage
                anchors { left: parent.left; top: parent.top }
                size: parent.height
                peer: model.item
            }

            Text {
                anchors {
                    left: peerimage.right
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                text: model.dialogTitle
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
                font.pointSize: Theme.fontSizeMedium
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
