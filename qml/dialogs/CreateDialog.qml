import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4

Dialog
{
    property var context

    signal createGroup(bool ischannel)

    id: createdialog
    title: qsTr("Create...")

    contentItem: Item {
        implicitWidth: Math.max(lblgroups.contentWidth, lblchannels.contentWidth) + Theme.paddingLarge
        implicitHeight: content.height + Theme.paddingMedium

        ColumnLayout {
            id: content
            x: Theme.paddingSmall
            y: Theme.paddingSmall
            width: parent.width - (x * 2)
            spacing: Theme.paddingMedium

            ExclusiveGroup { id: exclusivegroup }

            RadioButton
            {
                id: rbnewgroup
                text: qsTr("New Group")
                exclusiveGroup: exclusivegroup
            }

            Label
            {
                id: lblgroups
                text: qsTr("Groups are ideal for limited communities they can have up to 5000 members")
                wrapMode: Text.Wrap
                color: "gray"
            }

            RadioButton
            {
                id: rbnewchannel
                text: qsTr("New Channel")
                exclusiveGroup: exclusivegroup
            }

            Label
            {
                id: lblchannels
                text: qsTr("Channels are a tool for broadcasting your messages to unlimited audiences")
                wrapMode: Text.Wrap
                color: "gray"
            }

            Button
            {
                text: qsTr("Create")
                anchors { right: parent.right; rightMargin: Theme.paddingMedium }
                enabled: rbnewgroup.checked || rbnewchannel.checked

                onClicked: {
                    createdialog.createGroup(rbnewchannel.checked);
                    createdialog.close();
                }
            }
        }
    }
}
