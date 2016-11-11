import QtQuick 2.4
import QtQuick.Controls 1.4
import LibQTelegram 1.0

Item
{
    readonly property real contentWidth: waveform.contentWidth
    property alias barColor: waveform.barColor
    property alias source: waveform.message
    property string duration

    id: audiomessage
    height: waveform.height + lblduration.contentHeight

    Image
    {
        id: imgplay
        width: Theme.itemSizeMedium
        height: Theme.itemSizeMedium
        anchors { verticalCenter: parent.verticalCenter; verticalCenterOffset: Theme.paddingMedium }
        fillMode: Image.PreserveAspectFit
        source: "qrc:///res/play.png"

        BusyIndicator { z: 2; anchors.centerIn: parent; running: mediamessageitem.downloading }
        MouseArea { anchors.fill: parent; onClicked: mediamessageitem.download() }
    }

    Waveform
    {
        id: waveform
        anchors { left: imgplay.right; top: parent.top; topMargin: Theme.paddingSmall; right: parent.right; leftMargin: Theme.paddingSmall }
        height: Theme.itemSizeSmall
    }

    Text
    {
        id: lblduration
        anchors { left: imgplay.right; top: waveform.bottom; right: parent.right; leftMargin: Theme.paddingSmall; topMargin: Theme.paddingMedium }
        font.pointSize: Theme.fontSizeSmall
        color: Theme.mainTextColor
        text: audiomessage.duration + " <font color='" + waveform.barColor + "'>⚫</font>";
    }
}
