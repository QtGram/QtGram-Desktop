import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import "../../component"
import "../../js/CountryList.js" as CountryList

ViewContainer
{
    id: registerview

    ColumnLayout
    {
        readonly property real maxWidth: 256

        id: column
        anchors { left: parent.left; top: parent.top; right: parent.right; topMargin: 20 }
        width: column.maxWidth

        Image { source: "qrc:///res/app.png"; sourceSize: Qt.size(column.maxWidth, column.maxWidth); anchors.horizontalCenter: parent.horizontalCenter }
        Label { text: "QtGram"; font.pixelSize: 50; horizontalAlignment: Text.AlignHCenter; Layout.preferredWidth: column.maxWidth; anchors.horizontalCenter: parent.horizontalCenter }
        ComboBox { id: cbcountries; anchors.horizontalCenter: parent.horizontalCenter; model: CountryList.countries; Layout.preferredWidth: column.maxWidth }

        RowLayout
        {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            TextField
            {
                readonly property real maxWidth: font.pixelSize * 4

                id: tfccode
                text: "+" + CountryList.countries[cbcountries.currentIndex].code
                Layout.preferredWidth: tfccode.maxWidth
            }

            TextField
            {
                id: tfphonenumber
                placeholderText: qsTr("Phone Number")
                Layout.preferredWidth: column.maxWidth - tfccode.maxWidth
            }
        }

        Button
        {
            id: btnnext
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Next")
            enabled: tfphonenumber.text.length > 0
            Layout.preferredWidth: column.maxWidth

            onClicked: {
                btnnext.enabled = false;
                btnnext.text = qsTr("Sending request...");

                context.telegram.initializer.phoneNumber = tfccode.text + tfphonenumber.text;
            }
        }
    }
}
