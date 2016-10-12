import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "../../component"
import "../../js/CountryList.js" as CountryList

ViewContainer
{
    id: signinview

    ColumnLayout
    {
        readonly property real maxWidth: 256

        id: column
        anchors { left: parent.left; top: parent.top; right: parent.right; topMargin: 20 }
        width: column.maxWidth

        Image { source: "qrc:///res/app.png"; sourceSize: Qt.size(column.maxWidth, column.maxWidth); anchors.horizontalCenter: parent.horizontalCenter }

        Text
        {
            text: qsTr("Wait for the SMS containing the activation code and press 'Sign In'")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
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
            id: btnsignin
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Sign In")
            enabled: tfcode.text.length > 0
            Layout.preferredWidth: column.maxWidth

            onClicked: {
                btnsignin.enabled = false;
                btnsignin.text = qsTr("Sending request...");
                context.telegram.signIn(tfcode.text);
            }
        }
    }
}
