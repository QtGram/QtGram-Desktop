import QtQuick 2.4

MouseArea
{
    property real contentHeight
    property ThemeListMenu menu: null

    id: themelistitem
    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onMenuChanged: {
        menu.parent = themelistitem;
        menu.anchors.bottom = themelistitem.bottom;
    }

    height: {
        var h = contentHeight;

        if(menu && menu.visible)
            h += menu.height;

        return h;
    }

    onClicked: {
        if(!menu)
            return;

        if(mouse.button === Qt.RightButton) {
            menu.visible = !menu.visible;
            return;
        }

        menu.visible = false;
    }
}
