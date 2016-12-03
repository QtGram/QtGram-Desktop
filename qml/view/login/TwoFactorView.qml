import QtQuick 2.4
import "../../component"
import "../../component/theme"

ViewContainer
{
    property string hint

    id: twofactorview

    Connections
    {
        target: context.telegram

        onInvalidPassword: {
            txtinvalidpassword.visible = true;
            btnsubmit.text = qsTr("Submit");
            btnsubmit.enabled = true;
        }
    }

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
        width: btnsubmit.width * 3

        anchors {
            top: imglogo.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.paddingLarge
        }

        Text
        {
            text: qsTr("Please enter your cloud password")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        Text
        {
            id: txtinvalidpassword
            font { bold: true; underline: true }
            color: Theme.mainColor
            text: qsTr("Invalid password")
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        ThemeTextField
        {
            id: tfcloudpassword
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Your cloud password")
            echoMode: TextInput.Password
        }

        Text
        {
            text: qsTr("Hint: %1").arg(hint)
            visible: hint.length > 0
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        ThemeButton
        {
            id: btnsubmit
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Submit")
            enabled: tfcloudpassword.text.length > 0

            onClicked: {
                txtinvalidpassword.visible = false;
                btnsubmit.enabled = false;
                btnsubmit.text = qsTr("Sending request...");
                context.telegram.sendPassword(tfcloudpassword.text);
            }
        }
    }
}
