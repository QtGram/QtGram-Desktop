import QtQuick 2.4
import "theme"

ThemeListView
{
    property real contentHeight: Theme.itemSizeSmall

    signal openStickers(var stickerset)

    function toggle() {
        height = height ? 0 : contentHeight
    }

    Behavior on height {
        NumberAnimation { duration: 250; easing.type: Easing.OutQuad }
    }

    id: stickersbar
    anchors { leftMargin: -1; rightMargin: -1 }
    spacing: Theme.paddingMedium
    visible: height > 0
    height: 0
    orientation: ListView.Horizontal
    clip: true

    delegate: StickerImage {
        y: Theme.paddingSmall
        width: contentHeight
        height: contentHeight - (Theme.paddingSmall * 2)
        sticker: model.stickerPreview
        showThumbnail: true

        MouseArea {
            anchors.fill: parent

            onClicked: {
                toggle();
                openStickers(model.item);
            }
        }
    }
}
