import QtQuick 2.4
import QtQuick.Dialogs 1.2
import LibQTelegram 1.0 as LibQTelegram
import "../component/theme"

Dialog
{
    property alias peer: peerprofile.peer
    property var context

    LibQTelegram.PeerProfile
    {
        id: peerprofile
        telegram: context.telegram
    }

    id: contactsdialog
    title: qsTr("%1's Profile").arg(peerprofile.title)
    width: 300

    contentItem: Column  {
        width: contactsdialog.width
        spacing: Theme.paddingMedium

        Item { width: parent.width; height: Theme.paddingSmall }

        LibQTelegram.PeerImage
        {
            anchors.horizontalCenter: parent.horizontalCenter
            size: Theme.itemSizeMedium
            backgroundColor: Theme.mainColor
            foregroundColor: Theme.mainTextColor
            fontPixelSize: Theme.fontSizeLarge
            peer: contactsdialog.peer
        }

        Text
        {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font { bold: true; pointSize: Theme.fontSizeMedium }
            text: peerprofile.title
        }

        Text
        {
            width: parent.width
            text: peerprofile.statusText
            horizontalAlignment: Text.AlignHCenter
            color: Theme.mainColor
        }

        Item { width: parent.width; height: Theme.paddingMedium }

        Text
        {
            x: Theme.paddingSmall
            font.bold: true
            width: parent.width - (x * 2)
            text: qsTr("Info:")
            horizontalAlignment: Text.AlignLeft
            color: Theme.mainColor
        }

        Text
        {
            x: Theme.paddingSmall
            width: parent.width - (x * 2)
            text: "<font color='" + Theme.mainColor + "'<b>" + qsTr("Phone number") + ": </b></font>+" + peerprofile.phoneNumber
            visible: peerprofile.hasPhoneNumber
            horizontalAlignment: Text.AlignLeft
            elide: Text.ElideRight
        }

        Text
        {
            x: Theme.paddingSmall
            width: parent.width - (x * 2)
            text: "<font color='" + Theme.mainColor + "'<b>" + qsTr("Username") + ": </b></font>@" + peerprofile.username
            visible: peerprofile.hasUsername
            horizontalAlignment: Text.AlignLeft
            elide: Text.ElideRight
        }

        Item { width: parent.width; height: Theme.paddingMedium }

        ThemeButton
        {
            x: Theme.paddingSmall
            width: parent.width - (x * 2)

            text: {
                if(peerprofile.isMuted)
                    return qsTr("Enable notifications");

                return qsTr("Disable notifications");
            }

            onClicked: {
                peerprofile.isMuted = !peerprofile.isMuted;
            }
        }

        ThemeButton
        {
            x: Theme.paddingSmall
            width: parent.width - (x * 2)
            visible: peerprofile.isUser
            text: qsTr("Block")
        }

        ThemeButton
        {
            x: Theme.paddingSmall
            width: parent.width - (x * 2)
            visible: peerprofile.isChat
            text: qsTr("Leave %1").arg(peerprofile.isBroadcast ? qsTr("Channel") : qsTr("Group"))
        }

        Item { width: parent.width; height: Theme.paddingSmall }
    }
}
