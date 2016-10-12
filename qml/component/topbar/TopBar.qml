import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

Row
{
    signal contactsRequested()

    height: Theme.itemSizeExtraSmall + (Theme.paddingSmall * 2)
    spacing: 10
    anchors { leftMargin: 10; rightMargin: 10 }

    TopBarItem
    {
        id: tbisettings
        text: qsTr("Settings")
    }

    TopBarItem
    {
        text: qsTr("Contacts")
        onClicked: contactsRequested()
    }

    TopBarItem
    {
        text: qsTr("Info")
    }
}
