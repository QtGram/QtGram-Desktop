import QtQuick 2.0

MouseArea
{
    property alias image: imgcontent.source
    property alias text: txtcontent.text
    property alias font: txtcontent.font
    property bool autoSize: false
    property bool alternateColor: false

    readonly property color color: alternateColor ? Theme.alternateMainColor : Theme.mainColor

    id: themebutton
    hoverEnabled: true
    implicitHeight: Theme.defaultHeight

    implicitWidth: {
        if(autoSize)
            return txtcontent.contentWidth + (Theme.paddingLarge * 2);

        return Theme.defaultWidth;
    }

    Rectangle
    {
        id: color
        anchors.fill: parent

        color: {
            if(!themebutton.enabled)
                return Qt.darker(themebutton.color, Theme.colorSweep);

            if(themebutton.containsMouse)
                return Qt.lighter(themebutton.color, Theme.colorSweep);

            return themebutton.color;
        }

        Image
        {
            id: imgcontent
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height) - Theme.paddingLarge
            height: Math.min(parent.width, parent.height) - Theme.paddingLarge
            fillMode: Image.PreserveAspectFit
            visible: txtcontent.text.length <= 0
        }

        Text
        {
            id: txtcontent
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: imgcontent.status === Image.Null

            color: {
                if(!themebutton.enabled)
                    return Qt.darker(Theme.mainTextColor, Theme.colorSweep);

                return Theme.mainTextColor;
            }
        }
    }
}
