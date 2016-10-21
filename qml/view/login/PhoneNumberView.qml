import QtQuick 2.0
import "../../component"
import "../../component/theme"
import "../../js/CountryList.js" as CountryList

ViewContainer
{
    id: phonenumberview

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
            text: qsTr("Insert your phone number:")
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }

        ThemeComboBox
        {
            id: cbcountries
            width: parent.width * 0.6
            anchors.horizontalCenter: parent.horizontalCenter
            model: CountryList.countries
        }

        Row
        {
            id: row
            width: parent.width * 0.6
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingSmall

            ThemeTextField
            {
                id: tfcode
                width: Theme.itemSizeSmall
                text: "+" + CountryList.countries[cbcountries.currentIndex].code
            }

            ThemeTextField
            {
                id: tfphonenumber
                width: parent.width - tfcode.width - row.spacing
                placeholderText: qsTr("Phone Number")
            }
        }

        ThemeButton
        {
            id: btnnext
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Next")
            enabled: tfphonenumber.text.length > 0

            onClicked: {
                btnnext.enabled = false;
                btnnext.text = qsTr("Sending request...");

                context.telegram.initializer.phoneNumber = tfccode.text + tfphonenumber.text;
            }
        }
    }
}
