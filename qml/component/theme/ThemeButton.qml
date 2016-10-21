import QtQuick 2.0

MouseArea
{
    property alias text: txtcontent.text
    property alias font: txtcontent.font

    id: themebutton
    hoverEnabled: true
    implicitWidth: Math.min(Theme.defaultWidth, txtcontent.contentWidth + (Theme.paddingLarge * 2))
    implicitHeight: Theme.defaultHeight

    Rectangle
    {
        anchors.fill: parent

        color: {
            if(!themebutton.enabled)
                return Qt.darker(Theme.mainColor, Theme.colorSweep);

            if(themebutton.containsMouse)
                return Qt.lighter(Theme.mainColor, Theme.colorSweep);

            return Theme.mainColor;
        }

        Text
        {
            id: txtcontent
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            color: {
                if(!themebutton.enabled)
                    return Qt.darker(Theme.mainTextColor, Theme.colorSweep);

                return Theme.mainTextColor;
            }
        }
    }
}
