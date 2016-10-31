import QtQuick 2.0
import "../../component"
import "../../component/theme"

ViewContainer
{
    id: signinview

    Connections
    {
        target: context.telegram

        onPhoneCodeError: {
            txterrormsg.text = qsTr("ERROR: %1").arg(errormessage);

            btnsignin.enabled = true;
            btnsignin.text = qsTr("Sign In");

            timdisablebutton.restart();
        }
    }

    Timer
    {
        id: timdisablebutton
        running: false
        interval: 2000
    }

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
            text: qsTr("Wait for the SMS containing the activation code and press 'Sign In'")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        Text
        {
            id: txterrormsg
            font { bold: true; underline: true }
            color: Theme.mainColor
            visible: txterrormsg.visible
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
        }

        ThemeTextField
        {
            id: tfcode
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Code")
        }

        ThemeButton
        {
            id: btnsignin
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Sign In")
            enabled: tfcode.text.length > 0

            onClicked: {
                btnsignin.enabled = false;
                btnsignin.text = qsTr("Sending request...");
                context.telegram.signIn(tfcode.text);
            }
        }

        ThemeButton
        {
            id: btnresendcode
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: !timdisablebutton.running

            text: timdisablebutton.running ? qsTr("Requesting new code...") : qsTr("Resend code")

            onClicked: {
                timdisablebutton.start();
                context.telegram.resendCode();
            }
        }
    }
}
