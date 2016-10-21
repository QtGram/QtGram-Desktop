import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "../../component"
import "../../js/CountryList.js" as CountryList

ViewContainer
{
    id: signupview

    Timer
    {
        id: timdisablebutton
        running: false
        interval: 2000
    }

    ColumnLayout
    {
        readonly property real maxWidth: 256

        id: column
        anchors { left: parent.left; top: parent.top; right: parent.right; topMargin: 20 }
        width: column.maxWidth

        Image { source: "qrc:///res/app.png"; sourceSize: Qt.size(column.maxWidth, column.maxWidth); anchors.horizontalCenter: parent.horizontalCenter }

        Text
        {
            text: qsTr("Wait for the SMS containing the activation code and press 'Sign Up'")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            Layout.preferredWidth: column.maxWidth
        }

        TextField
        {
            id: tffirstname
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("First Name")
            Layout.preferredWidth: column.maxWidth
        }

        TextField
        {
            id: tflastname
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Last Name (Optional)")
            Layout.preferredWidth: column.maxWidth
        }

        TextField
        {
            id: tfcode
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Code")
            Layout.preferredWidth: column.maxWidth
        }

        Button
        {
            id: btnsignup
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Sign Up")
            enabled: (tffirstname.text.length > 0) && (tfcode.text.length > 0)
            Layout.preferredWidth: column.maxWidth

            onClicked: {
                btnsignup.enabled = false;
                btnsignup.text = qsTr("Sending request...");
                context.telegram.signUp(tffirstname.text, tflastname.text, tfcode.text);
            }
        }

        Button
        {
            id: btnresendcode
            anchors.horizontalCenter: parent.horizontalCenter
            enabled: !timdisablebutton.running
            Layout.preferredWidth: column.maxWidth

            text: timdisablebutton.running ? qsTr("Requesting new code...") : qsTr("Resend code")

            onClicked: {
                timdisablebutton.start();
                context.telegram.resendCode();
            }
        }
    }
}
