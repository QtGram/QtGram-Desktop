import QtQuick 2.4

Column
{
    property alias url: wpurl.text
    property alias title: wptitle.text
    property alias description: wpdescription.text
    property alias source: imgthumbnail.source

    id: webpageelement

    Text
    {
        id: wpurl
        width: parent.width
        wrapMode: Text.Wrap
    }

    Text
    {
        id: wptitle
        width: parent.width
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
    }

    Text
    {
        id: wpdescription
        width: parent.width
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
    }

    Image
    {
        id: imgthumbnail
        width: parent.width
        asynchronous: true
        fillMode: Image.PreserveAspectFit
    }
}
