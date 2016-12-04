import QtQuick 2.0

ThemeFrame
{
    property alias model: lvelements.model
    property alias currentIndex: lvelements.currentIndex
    property string invalidText

    id: themecombobox
    implicitWidth: Theme.defaultWidth + Theme.itemSizeSmall
    height: Theme.defaultHeight

    function toggleListView() {
        if(lvelements.visible) {
            lvelements.visible = false;
            return;
        }

        lvelements.x = 0;
        lvelements.y = themecombobox.height - 1;
        lvelements.width = themecombobox.width;
        lvelements.visible = true;
    }

    Text
    {
        id: tiselecteditem
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        wrapMode: Text.NoWrap
        height: Theme.defaultHeight

        anchors {
            left: parent.left
            top: parent.top
            right: tibutton.right
            leftMargin: Theme.paddingSmall
        }

        text: {
            if(lvelements.currentIndex > -1)
                return lvelements.getCurrentText();

            return themecombobox.invalidText;
        }
    }

    ThemeButton
    {
        id: tibutton
        anchors { right: parent.right; top: parent.top; bottom: parent.bottom }
        width: parent.height
        font.pointSize: Theme.fontSizeLarge
        text: "▼"
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: toggleListView()
        z: 2
    }

    ThemeListView
    {
        function getTextAt(index) {
            return lvelements.model[index].text;
        }

        function getCurrentText() {
            return getTextAt(lvelements.currentIndex);
        }

        id: lvelements
        visible: false
        width: lvelements.width
        height: Math.min(count, 5) * Theme.itemSizeSmall
        clip: true
        z: 10

        onModelChanged: {
            currentIndex = 0;
        }

        delegate: MouseArea {
            width: lvelements.width
            height: Theme.itemSizeSmall

            onClicked: {
                lvelements.currentIndex = model.index;
                lvelements.visible = false;
            }

            Rectangle {
                anchors.fill: parent
                visible: model.index === lvelements.currentIndex
                color: Theme.mainColor
                z: -1
            }

            Text {
                anchors { fill: parent; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
                color: (model.index === lvelements.currentIndex) ? Theme.mainTextColor : Theme.textColor
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                text: lvelements.getTextAt(model.index)
            }
        }
    }
}
