import QtQuick 2.4
import QtGraphicalEffects 1.0

MouseArea
{
    property bool syncing: false
    property bool connected: false

    id: connectionstatus
    width: height
    enabled: !context.telegram.connected
    onClicked: context.telegram.reconnect()

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
                position: 0.6

                color: {
                    if(syncing)
                        return "#c3c342";

                    return connected ? "#80c342" : "#c38042";
                }
            }
        }
    }
}
