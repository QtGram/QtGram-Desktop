import QtQuick 2.4

Row
{
    readonly property real contentWidth: image.width + Math.max(txthiddenfilename.contentWidth, txthiddenfilesize.contentWidth) + Theme.paddingSmall
    property alias fileName: txthiddenfilename.text
    property alias fileSize: txthiddenfilesize.text

    id: filemessage
    spacing: Theme.paddingSmall
    height: image.height

    Image
    {
        id: image
        asynchronous: true
        width: Theme.itemSizeSmall
        height: Theme.itemSizeSmall
    }

    Column
    {
        id: coltext
        width: parent.width - image.width
        height: parent.height

        Text { id: txthiddenfilename; visible: false }
        Text { id: txthiddenfilesize; visible: false }

        Text
        {
            id: txtfilename
            width: parent.width - Theme.paddingSmall
            text: txthiddenfilename.text
            elide: Text.ElideRight
        }

        Text
        {
            id: txtfilesize
            width: parent.width
            text: txthiddenfilesize.text
            elide: Text.ElideRight
        }
    }
}
