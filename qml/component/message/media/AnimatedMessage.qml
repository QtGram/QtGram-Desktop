import QtQuick 2.4
import QtMultimedia 5.0

MouseArea
{
    property alias source: mediaplayer.source

    id: animatedmessage

    onClicked: mediamessageitem.download()

    Image {
        id: imgthumbnail
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        visible: !mediamessageitem.downloaded
        source: mediamessageitem.thumbnail
    }

    MediaPlayer {
        id: mediaplayer
        loops: MediaPlayer.Infinite
        autoPlay: true
    }

    VideoOutput {
        anchors.fill: parent
        source: mediaplayer
        visible: mediamessageitem.downloaded
    }
}
