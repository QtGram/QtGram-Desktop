import QtQuick 2.4
import QtMultimedia 5.0
import QtGraphicalEffects 1.0
import LibQTelegram 1.0

Item
{
    property real size
    property var context
    property Message tgMessage

    readonly property FileObject foImage: {
        if(context.telegram.messageHasImage(tgMessage))
            return context.telegram.fileObject(tgMessage);

        return null;
    }


    readonly property real aspectRatio: {
        if(!foImage)
            return 0;

        var imagesize = foImage.imageSize;
        var w = imagesize.width;
        var h = imagesize.height;

        if(!w || !h)
            return 0;

        return w / h;
    }

    id: messageimage
    visible: foImage !== null
    width: size
    height: aspectRatio ? (size / aspectRatio) : 0

    MediaPlayer
    {
        id: mediaplayer
        loops: MediaPlayer.Infinite
        autoPlay: context.telegram.messageIsAnimated(tgMessage)

        source: {
            if(!context.telegram.messageIsAnimated(tgMessage))
                return "";

            return foImage ? foImage.filePath : "";
        }
    }

    VideoOutput
    {
        anchors.fill: parent
        visible: context.telegram.messageIsAnimated(tgMessage)
        source: mediaplayer
    }

    Image
    {
        id: imgmedia
        anchors.fill: parent
        fillMode: Image.Stretch
        visible: source.toString().length > 0

        source: {
            if(context.telegram.messageIsAnimated(tgMessage))
                return "";

            return foImage ? foImage.thumbnail : "";
        }
    }

    FastBlur
    {
        id: thumbnailblur
        anchors.fill: imgmedia
        source: imgmedia
        visible: imgmedia.visible

        radius: {
            if(foImage && !foImage.downloaded)
                return 32.0;

            return 0;
        }

        Behavior on radius { NumberAnimation { duration: 250 } }
    }
}
