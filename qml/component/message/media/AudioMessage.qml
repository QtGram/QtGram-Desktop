import QtQuick 2.4
import LibQTelegram 1.0

Item
{
    readonly property real contentWidth: waveform.contentWidth
    property alias duration: lblduration.text
    property alias barColor: waveform.barColor
    property alias source: waveform.message

    id: audiomessage
    height: waveform.height + lblduration.contentHeight

    Image
    {
        id: imgplay
        width: Theme.itemSizeMedium
        height: Theme.itemSizeMedium
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "qrc:///res/play.png"
    }

    Waveform
    {
        id: waveform
        clip: true
        anchors { left: imgplay.right; right: parent.right; leftMargin: Theme.paddingSmall }
        height: Theme.itemSizeSmall
    }

    Text
    {
        id: lblduration
        anchors { left: imgplay.right; top: waveform.bottom; right: parent.right; leftMargin: Theme.paddingSmall; topMargin: Theme.paddingSmall }
        font.pointSize: Theme.fontSizeSmall
        color: Theme.mainTextColor
    }
}
