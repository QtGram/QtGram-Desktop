import QtQuick 2.0
import QtQuick.Controls 1.4
import LibQTelegram 1.0
import "../../component"
import "../../component/theme"
import "../../item"
import "../subview"

ViewContainer
{
    readonly property bool isDialogsView: true

    id: dialogsview

    function openCloud() {
        stackview.push({ item: Qt.resolvedUrl("../subview/MessagesView.qml"),
                         properties: { context: dialogsview.context, dialog: context.dialogs.cloudDialog },
                         replace: true });
    }

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
