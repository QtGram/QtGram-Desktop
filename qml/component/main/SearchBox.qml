import QtQuick 2.4
import "../theme"

Row
{
    id: searchbox
    height: tfsearch.height

    ThemeButton
    {
        id: tbnew
        width: parent.height
        height: parent.height
        image: "qrc:///res/new.png"
        onClicked: context.openDialogSelector()
    }

    ThemeTextField
    {
        id: tfsearch
        width: parent.width - tbnew.width
        placeholderText: qsTr("Search...")
    }
}
