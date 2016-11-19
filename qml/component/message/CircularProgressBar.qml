import QtQuick 2.4

Rectangle {
    id: root
    color: "#22000000"
    width: Theme.itemSizeMedium
    height: width
    radius: width / 2

    property real progress: 0
    property int lineWidth: Theme.paddingSmall
    property bool rotating: false

    onProgressChanged: {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        height: parent.height - Theme.paddingSmall
        width: height
        anchors.centerIn: parent

        rotation: -90
        NumberAnimation on rotation {
            from: 0
            to: 360
            duration: 2000
            loops: Animation.Infinite
            running: root.rotating
        }


        onPaint: {
            var ctx = canvas.getContext("2d");
            ctx.save();
            ctx.reset();

            ctx.strokeStyle = "white"
            ctx.lineWidth = lineWidth;

            ctx.beginPath();
            ctx.arc(canvas.width/2,canvas.height/2, canvas.height / 2 - ctx.lineWidth, 0, (Math.PI*2*(progress)),false);
            ctx.stroke();
            ctx.closePath();

            ctx.restore();
        }
    }
}

