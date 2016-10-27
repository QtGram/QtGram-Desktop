import QtQuick 2.4

Column
{
    property alias source: imgmap.source
    property string title
    property string address

    id: locationmessage
    width: imgmap.width

    Text {
        id: txtvenue
        wrapMode: Text.Wrap
        font.pointSize: Theme.fontSizeSmall
        visible: (title.length > 0) || (address.length > 0)

        text: {
            if(address.length > 0)
                return title + "\n" + address;

            return title;
        }
    }

    Image {
        id: imgmap
        asynchronous: true
        fillMode: Image.PreserveAspectFit
    }
}
