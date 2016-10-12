import QtQuick 2.4
import QtQuick.Controls 1.4

Text
{
    signal clicked()

    id: topbaritem
    height: parent.height
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter

    MouseArea
    {
        anchors.fill: parent
        onClicked: topbaritem.clicked()
    }
}
