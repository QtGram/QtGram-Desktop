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
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: Theme.paddingLarge
        }
    }

    Column
    {
        id: column
        spacing: Theme.paddingMedium

        anchors {
            left: imglogo.right
            right: parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: Theme.paddingMedium
            rightMargin: Theme.paddingMedium
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
    }
}
