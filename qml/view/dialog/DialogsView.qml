import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import LibQTelegram 1.0
import "../../component"
import "../../component/listview"
import "../../item"
import "../subview"

ViewContainer
{
    id: dialogsview

    SplitView
    {
        anchors.fill: parent
        orientation: Qt.Horizontal

        StyledListView
        {
            id: lvdialogs
            spacing: Theme.paddingSmall
            backgroundColor: "aliceblue"
            clip: true

            Layout.minimumWidth: parent.width * 0.35
            Layout.maximumWidth: parent.width * 0.35

            /*
            header: TextField {
                width: parent.width
                placeholderText: qsTr("Search...")
            }
            */

            model: DialogsModel {
                id: dialogsmodel
                telegram: context.telegram
            }

            delegate: DialogItem {
                width: parent.width
                context: dialogsview.context
                tgDialog: model.item

                onClicked: {
                    lvdialogs.currentIndex = index;

                    stackview.push({ item: Qt.resolvedUrl("../subview/MessagesView.qml"),
                                     properties: { context: dialogsview.context, tgDialog: model.item },
                                     replace: true });
                }
            }
        }

        StackView
        {
            id: stackview
            clip: true

            initialItem: PlaceholderView {
                context: dialogsview.context
            }
        }
    }
}
