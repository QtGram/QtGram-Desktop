import QtQuick 2.4
import "../component"
import "../component/theme"

ViewContainer
{
    property int seconds

    id: floodlockview

    Image
    {
        id: imglogo
        source: "qrc:///res/app.png";
        fillMode: Image.PreserveAspectFit

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: -Theme.paddingMedium
        }
    }

    Column
    {
        id: column
        spacing: Theme.paddingMedium
        width: btnclose.width * 3

        anchors {
            top: imglogo.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.paddingLarge
        }

        Text
        {
            text: qsTr("Client locked")
            font { bold: true; underline: true; pointSize: Theme.fontSizeHuge }
            color: Theme.mainColor
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        Text
        {
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.NoWrap

            text: {
                var now = new Date(Date.now());
                now.setSeconds(now.getSeconds() + floodlockview.seconds);
                return qsTr("Unlock at: %1").arg(now.toLocaleString());
            }
        }

        ThemeButton
        {
            id: btnclose
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Close")
            onClicked: Qt.quit();
        }
    }
}
