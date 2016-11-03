import QtQuick 2.0
import QtQuick.Controls 1.4
import LibQTelegram 1.0
import "../../component"
import "../../component/theme"
import "../../item"
import "../subview"

ViewContainer
{
    id: dialogsview

    function openDialog(index, dialog) {
        lvdialogs.currentIndex = index;

        stackview.push({ item: Qt.resolvedUrl("../subview/MessagesView.qml"),
                         properties: { context: dialogsview.context, dialog: dialog },
                         replace: true });
    }

    Connections
    {
        target: context.contacts
        onDialogCreated: openDialog(context.dialogs.indexOf(dialog), dialog)
    }

    Item
    {
        id: leftpart
        anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
        width: parent.width * 0.35

        ThemeTextField
        {
            id: tfsearch
            anchors { left: parent.left; top: parent.top; right: parent.right; topMargin: -1 }
            placeholderText: qsTr("Search...")
        }

        ThemeListView
        {
            id: lvdialogs
            anchors { left: parent.left; top: tfsearch.bottom; right: parent.right; bottom: parent.bottom; topMargin: -1 }
            spacing: Theme.paddingSmall
            placeholderText: qsTr("Chat list is empty")
            model: context.dialogs
            clip: true

            delegate: DialogModelItem {
                width: lvdialogs.width
                context: dialogsview.context
                onClicked: openDialog(model.index, model.item)
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
    }
}
