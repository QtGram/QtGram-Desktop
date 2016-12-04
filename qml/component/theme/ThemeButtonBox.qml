import QtQuick 2.4

Row
{
    property alias canAccept: btnaccept.enabled
    property alias acceptText: btnaccept.text
    property alias cancelText: btncancel.text

    signal accepted()
    signal rejected()

    id: themebuttonbox
    height: Theme.defaultHeight + (Theme.paddingMedium * 2)
    layoutDirection: Qt.RightToLeft
    spacing: Theme.paddingMedium

    anchors {
        left: parent.left
        bottom: parent.bottom
        right: parent.right
        leftMargin: Theme.paddingMedium
        rightMargin: Theme.paddingMedium
    }

    ThemeButton
    {
        id: btnaccept
        autoSize: true
        anchors.verticalCenter: parent.verticalCenter
        onClicked: accepted()
    }

    ThemeButton
    {
        id: btncancel
        autoSize: true
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Cancel")
        onClicked: rejected()
    }
}
