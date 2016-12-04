import QtQuick 2.0
import "../../dialog"
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

    UnreadCounter
    {
        id: unreadcounter
        alternateColor: true
        y: Theme.paddingSmall
        size: parent.height - (y * 2)
        unreadCount: context.telegram.unreadCount

        anchors {
            left: parent.left
            leftMargin: Theme.paddingLarge
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
        orientation: ListView.Horizontal

        anchors {
            left: unreadcounter.right
            top: parent.top
            right: connectionstatus.right
            bottom: parent.bottom
            leftMargin: Theme.paddingMedium
            rightMargin: Theme.paddingMedium
        }

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

    ConnectionStatus
    {
        id: connectionstatus

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            rightMargin: Theme.paddingMedium
            topMargin: Theme.paddingSmall
            bottomMargin: Theme.paddingSmall
        }
    }
}
