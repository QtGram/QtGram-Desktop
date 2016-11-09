import QtQuick 2.0
import "../.."
import ".."

Rectangle
{
    property alias connectionStatus: connectionstatus
    property alias model: lvitems.model

    signal menuClicked(var value)

    id: thememenubar
    color: Theme.mainColor
    implicitHeight: Theme.itemSizeExtraSmall + (Theme.paddingSmall * 2)
    clip: true
    z: 10

    ConnectionStatus
    {
        id: connectionstatus

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            leftMargin: Theme.paddingMedium
            topMargin: Theme.paddingSmall
            bottomMargin: Theme.paddingSmall
        }
    }

    ListView
    {
        function getItemText(index) {
            return lvitems.model.get(index).text;
        }

        function getItemValue(index) {
            return lvitems.model.get(index).value;
        }

        id: lvitems

        anchors {
            left: connectionstatus.right
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            leftMargin: Theme.paddingMedium
            rightMargin: Theme.paddingMedium
        }

        orientation: ListView.Horizontal
        spacing: Theme.paddingMedium

        delegate: ThemeButton {
            implicitWidth: thememenubar.implicitHeight * 3
            height: thememenubar.implicitHeight
            text: lvitems.getItemText(model.index)

            onClicked: {
                var value = lvitems.getItemValue(model.index);
                thememenubar.menuClicked(value);
            }
        }
    }
}
