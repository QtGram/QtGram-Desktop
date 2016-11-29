import QtQuick 2.4

Image
{
    id: stickermessage
    source: mediamessageitem.downloaded ? mediamessageitem.source : mediamessageitem.thumbnail
}
