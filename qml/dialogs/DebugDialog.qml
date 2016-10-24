import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtGram 1.0
import "../component/theme"

Dialog
{
    property DebugCaller debugCaller: DebugCaller { }

    contentItem: Item {
        implicitWidth: 500
        implicitHeight: column.height

        Column {
            id: column
            width: parent.width

            ThemeListView {
                id: lvlistview
                width: parent.width
                height: 300
                model: debugCaller.methodList
                currentIndex: -1

                delegate: MouseArea {
                    width: lvlistview.width
                    height: Theme.itemSizeSmall

                    onClicked: {
                        lvlistview.currentIndex = model.index;
                    }

                    Rectangle {
                        anchors.fill: parent
                        color: (lvlistview.currentIndex === model.index) ? Theme.mainColor : "transparent"
                    }

                    Text {
                        anchors { fill: parent; leftMargin: Theme.paddingSmall; rightMargin: Theme.paddingSmall }
                        text: debugCaller.methodList[model.index]
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }

            Row {
                width: parent.width
                height: Theme.itemSizeSmall

                ThemeTextField {
                    id: tfparams
                    width: parent.width - btncall.width
                    enabled: lvlistview.currentIndex > -1
                    placeholderText: qsTr("Parameters...")
                }

                ThemeButton {
                    id: btncall
                    enabled: (lvlistview.currentIndex > -1) && tfparams.text.length > 1
                    autoSize: true
                    text: qsTr("Call")

                    onClicked: {
                        debugCaller.debugDownload(tfparams.text);
                    }
                }
            }
        }
    }
}
