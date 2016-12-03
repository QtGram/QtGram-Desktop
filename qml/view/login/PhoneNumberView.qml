import QtQuick 2.4
import "../../component"
import "../../component/theme"
import "../../js/CountryList.js" as CountryList

ViewContainer
{
    property bool isCodeValid: false

    id: phonenumberview

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
        width: btnnext.width * 3

        anchors {
            top: imglogo.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: Theme.paddingLarge
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
            invalidText: qsTr("Invalid code")
        }

        Row
        {
            id: row
            width: parent.width * 0.6
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingSmall

            Text { id: txtplus; text: "+"; anchors.verticalCenter: tfcode.verticalCenter }

            ThemeTextField
            {
                id: tfcode
                width: Theme.itemSizeSmall
                text: CountryList.countries[cbcountries.currentIndex].code

                onTextChanged: {
                    var index = CountryList.index[tfcode.text];

                    if(index === undefined)
                        cbcountries.currentIndex = -1;
                    else
                        cbcountries.currentIndex = index;
                }
            }

            ThemeTextField
            {
                id: tfphonenumber
                width: parent.width - txtplus.width - tfcode.width - (row.spacing * 2)
                placeholderText: qsTr("Phone Number")
            }
        }

        ThemeButton
        {
            id: btnnext
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Next")
            enabled: (cbcountries.currentIndex !== -1) && (tfphonenumber.text.length > 4)

            onClicked: {
                btnnext.enabled = false;
                btnnext.text = qsTr("Sending request...");

                context.telegram.initializer.phoneNumber = "+" + tfcode.text + tfphonenumber.text;
            }
        }
    }
}
