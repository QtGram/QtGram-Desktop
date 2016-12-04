import QtQuick 2.4
import "../theme"

Item
{
    property alias icon: imgdialog.source
    property alias title: lbltitle.text
    property alias description: lbldescription.text

    id: dialogview
    x: Theme.paddingSmall
    width: parent.width - (x * 2)
    height: Theme.itemSizeMedium

    Row
    {
        id: content
        anchors.fill: parent
        spacing: Theme.paddingSmall

        Image
        {
            id: imgdialog
            width: parent.height
            height: parent.height
            fillMode: Image.PreserveAspectFit

            sourceSize {
                width: parent.height
                height: parent.height
            }

            ThemeItem { z: -1; frameVisible: true; anchors.fill: parent }
        }

        Column
        {
            width: parent.width - imgdialog.width
            spacing: Theme.paddingSmall

            Text
            {
                id: lbltitle
                width: parent.width
                font.bold: true
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                elide: Text.ElideRight
                color: Theme.mainColor
            }

            Text
            {
                id: lbldescription
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                text: Text.Wrap
            }
        }
    }
}
