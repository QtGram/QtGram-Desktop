import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import "../component/theme"
import "../component/main"

Dialog
{
    property var context

    id: createdialog
    title: qsTr("Create...")

    contentItem: ThemeItem {
        implicitWidth: 600
        implicitHeight: content.height + Theme.paddingLarge

        Column
        {
            id: content
            anchors { top: parent.top; topMargin: Theme.paddingSmall }
            width: parent.width
            spacing: Theme.paddingMedium

            DialogView
            {
                icon: "qrc:///res/group_big.png"
                title: qsTr("New Group")
                description: qsTr("Groups are ideal for limited communities they can have up to 5000 members")

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        context.openNewGroup();
                        createdialog.close();
                    }
                }
            }

            DialogView
            {
                icon: "qrc:///res/channel_big.png"
                title: qsTr("New Channel")
                description: qsTr("Channels are a tool for broadcasting your messages to unlimited audiences")

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        context.openNewChannel();
                        createdialog.close();
                    }
                }
            }

            DialogView
            {
                icon: "qrc:///res/cloud_big.png"
                title: qsTr("Cloud Chat")
                description: qsTr("Store your files across your Telegram clients")

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        context.openCloud();
                        createdialog.close();
                    }
                }
            }
        }
    }
}
