import QtQuick 2.0
import QtQuick.Controls 1.4
import LibQTelegram 1.0
import "../../component"
import "../../component/theme"
import "../../component/main"
import "../../item"
import "../subview"

ViewContainer
{
    readonly property bool isDialogsView: true

    id: dialogsview

    Connections
    {
        target: context.contacts
        onDialogCreated: context.openDialog(dialog)
    }

    Item
    {
        id: leftpart
        anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
        width: parent.width * 0.35

        SearchBox
        {
            id: sbsearch
            anchors { left: parent.left; top: parent.top; right: parent.right; topMargin: -1 }
        }

        ThemeListView
        {
            id: lvdialogs
            anchors { left: parent.left; top: sbsearch.bottom; right: parent.right; bottom: parent.bottom; topMargin: -1 }
            spacing: Theme.paddingSmall
            placeholderText: qsTr("Chat list is empty")
            model: context.dialogs
            clip: true

            delegate: DialogModelItem {
                width: lvdialogs.width
                context: dialogsview.context

                onClicked: {
                    if(mouse.button !== Qt.LeftButton)
                        return;

                    context.openDialog(model.item);
                }
            }
        }

    }

    StackView
    {
        id: stackview
        anchors { left: leftpart.right; top: parent.top; bottom: parent.bottom; right: parent.right }
        clip: true

        initialItem: PlaceholderView {
            context: dialogsview.context
        }

        Component.onCompleted: {
            context.stackView = stackview;
        }
    }
}
