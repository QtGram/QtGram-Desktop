import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../../component"
import "../../component/theme"
import "../../item"

Dialog
{
    property var context

    signal dialogCreated(var dialog)

    id: createchannel
    title: qsTr("Create channel...")

    contentItem: ThemeItem {
        implicitWidth: 500
        implicitHeight: content.height + Theme.paddingSmall

        Column
        {
            id: content
            anchors { top: parent.top; topMargin: Theme.paddingSmall }
            x: Theme.paddingSmall
            width: parent.width - (x * 2)
            spacing: Theme.paddingMedium

            ThemeTextField
            {
                id: tftitle
                width: parent.width
                placeholderText: qsTr("Title")
            }

            ThemeTextField
            {
                id: tfdescription
                width: parent.width
                placeholderText: qsTr("Description")
            }

            Row
            {
                id: bottombar
                width: parent.width
                height: Theme.defaultHeight + (Theme.paddingMedium * 2)
                layoutDirection: Qt.RightToLeft
                spacing: Theme.paddingMedium

                ThemeButton
                {
                    autoSize: true
                    enabled: (tftitle.text.length > 0) && (tfdescription.text.length > 0)
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Create")
                }

                ThemeButton
                {
                    autoSize: true
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Cancel")
                    onClicked: createchat.close()
                }
            }
        }
    }
}
