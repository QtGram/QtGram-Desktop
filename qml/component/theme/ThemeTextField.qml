import QtQuick 2.0

ThemeFrame
{
    function focusTextInput() {
        titextinput.forceActiveFocus();
    }

    property alias placeholderText: tiplaceholder.text
    property alias echoMode: titextinput.echoMode
    property alias text: titextinput.text
    signal returnPressed()

    id: themetextfield

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.NoButton
    }

    TextInput
    {
        id: titextinput
        anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
        onAccepted: returnPressed()
    }

    Text
    {
        id: tiplaceholder
        anchors { fill: titextinput; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
        visible: (text.length > 0) && !titextinput.activeFocus && (titextinput.text.length <= 0)
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        color: Theme.placeholderTextColor
    }
}
