import QtQuick 2.4
import LibQTelegram 1.0
import "../js/TelegramHelper.js" as TelegraHelper

Item
{
    property real size
    property string fallbackText
    property FileObject peerImage

    id: peerimage
    width: size
    height: size

    Rectangle
    {
        visible: !peerImage || (peerImage.thumbnail.length <= 0)
        anchors.fill: parent
        radius: width * 0.5
        color: "gray"

        Text
        {
            anchors.centerIn: parent
            color: "black"
            text: TelegraHelper.fallbackText(peerimage.fallbackText)
        }
    }

    RoundedImage
    {
        id: imgpeer
        anchors.fill: parent
        visible: peerImage && (peerImage.thumbnail.length > 0)

        source: {
            if(!peerImage)
                return "";

            return peerImage.thumbnail;
        }
    }
}
