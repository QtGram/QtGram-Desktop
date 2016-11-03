import QtQuick 2.4
import "../theme"
import "../../item"
import "../../model"

ThemeListView
{
    property var context

    id: contactlist
    spacing: Theme.paddingSmall
    placeholderText: qsTr("No contacts")
    model: context.contacts

    section.property: "firstLetter"

    section.delegate: Rectangle {
        width: parent.width
        height: Theme.itemSizeExtraSmall
        color: Theme.mainColor
        z: -1

        Text {
            anchors { fill: parent; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
            horizontalAlignment: Text.AlignRight
            font { bold: true; pointSize: Theme.fontSizeLarge }
            color: Theme.mainTextColor
            text: section
        }
    }

    delegate: ContactModelItem {
        context: contactsdialog.context
        width: parent.width
    }
}
