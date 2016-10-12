import QtQuick 2.4
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

    Image
    {
        id: imgmedia
        anchors.fill: parent
        source: foImage ? foImage.thumbnail : ""
        fillMode: Image.Stretch
    }

    FastBlur
    {
        id: thumbnailblur
        anchors.fill: imgmedia
        source: imgmedia

        radius: {
            if(foImage && !foImage.downloaded)
                return 32.0;

            return 0;
        }

        Behavior on radius { NumberAnimation { duration: 250 } }
    }
}
