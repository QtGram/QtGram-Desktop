import QtQuick 2.4
import QtGraphicalEffects 1.0

Item
{
    property bool syncing: false
    property bool connected: false

    id: connectionstatus
    width: height

    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: connectionstatus.width
            height: connectionstatus.height
            radius: width * 0.5
        }
    }

    RadialGradient
    {
        id: gradient
        anchors.fill: parent

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "white"
            }

            GradientStop {
                position: 0.9

                color: {
                    if(syncing)
                        return "yellow";

                    return connected ? "green" : "red";
                }
            }
        }
    }
}
