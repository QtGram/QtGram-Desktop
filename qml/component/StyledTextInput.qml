import QtQuick 2.4

Rectangle
{
    property alias placeholderText: tiplaceholder.text
    property alias text: titextinput.text
    signal returnPressed()

    id: styledtextinput
    anchors { leftMargin: -1; rightMargin: -1; bottomMargin: -1 }
    color: "white"
    width: parent.width
    height: Theme.itemSizeSmall
    border { color: "gray"; width: 1 }

    TextInput
    {
        id: titextinput
        anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter; leftMargin: 1; rightMargin: 1 }
        onAccepted: returnPressed()
    }

    Text
    {
        id: tiplaceholder
        anchors.fill: titextinput
        visible: (text.length > 0) && !titextinput.activeFocus && (titextinput.text.length <= 0)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        color: "gray"
    }
}
