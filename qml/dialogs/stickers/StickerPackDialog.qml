import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../../component/sticker"

Dialog
{
    property var context
    property var stickerSet

    signal stickerSelected(var sticker)

    LibQTelegram.StickerPackModel {
        id: stickerpackmodel
        telegram: context.telegram
        stickerSet: stickerpackdialog.stickerSet
    }

    id: stickerpackdialog
    title: stickerpackmodel.title

    contentItem: Item {
        implicitWidth: 500
        implicitHeight: 400

        GridView {
            id: gvstickers
            anchors.fill: parent
            model: stickerpackmodel
            cellWidth: width / 4
            cellHeight: width / 4

            delegate: StickerImage {
                width: gvstickers.cellWidth
                height: gvstickers.cellHeight
                sticker: model.item
                showThumbnail: true

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        stickerSelected(model.item)
                        stickerpackdialog.close();
                    }
                }
            }
        }
    }
}
