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

    Rectangle
    {
        id: unreadcount
        width: height
        radius: width * 0.5
        color: Theme.mainTextColor

        anchors {
            left: connectionstatus.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: Theme.paddingLarge
            topMargin: Theme.paddingSmall
            bottomMargin: Theme.paddingSmall
        }

        Text {
            anchors.centerIn: parent
            text: context.telegram.unreadCount
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font { bold: true; pointSize: Theme.fontSizeSmall }
            color: Theme.mainColor
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
            left: unreadcount.right
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
