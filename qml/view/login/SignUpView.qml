import QtQuick 2.0
import "../../component"
import "../../component/theme"
import "../../js/CountryList.js" as CountryList

ViewContainer
{
    id: signupview

    Connections
    {
        target: context.telegram

        onPhoneCodeError: {
            txterrormsg.text = qsTr("ERROR: %1").arg(errormessage);

            btnsignup.enabled = true;
            btnsignup.text = qsTr("Sign Up");

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
            text: qsTr("Wait for the SMS containing the activation code and press 'Sign Up'")
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
            id: tffirstname
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("First Name")
        }

        ThemeTextField
        {
            id: tflastname
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Last Name (Optional)")
        }

        ThemeTextField
        {
            id: tfcode
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Code")
        }

        ThemeButton
        {
            id: btnsignup
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Sign Up")
            enabled: (tffirstname.text.length > 0) && (tfcode.text.length > 0)

            onClicked: {
                btnsignup.enabled = false;
                btnsignup.text = qsTr("Sending request...");
                context.telegram.signUp(tffirstname.text, tflastname.text, tfcode.text);
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
