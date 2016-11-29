import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../../component/theme"
import "../../item"

Dialog
{
    property var context

    id: contactsdialog
    title: qsTr("Stickers")

    contentItem: Item {
        implicitWidth: 500
        implicitHeight: 400

        ThemeListView {
            id: lvstickers
            anchors.fill: parent

            model: LibQTelegram.StickerSetsModel {
                telegram: context.telegram
            }

            delegate: StickerSetItem {
                width: parent.width
                height: Theme.itemSizeSmall
            }
        }
    }
}
