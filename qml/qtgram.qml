import QtQuick 2.0
import QtQuick.Controls 1.4
import "component/theme/menu"
import "model"
import "view"
import "js/Settings.js" as Settings

ApplicationWindow
{
    property Context context: Context {
        telegram {
            onSignInRequested: loader.setSource(Qt.resolvedUrl("view/login/SignInView.qml"), { "context": context });
            onSignUpRequested: loader.setSource(Qt.resolvedUrl("view/login/SignUpView.qml"), { "context": context });
            onLoginCompleted: loader.setSource(Qt.resolvedUrl("view/dialog/DialogsView.qml"), { "context": context });
        }

        Component.onCompleted: {
            Settings.load(function(tx) {
               var phonenumber = Settings.transactionGet(tx, "phonenumber");

                if(phonenumber !== false) {
                    context.telegram.initializer.phoneNumber = phonenumber;
                    return
                }

                loader.setSource(Qt.resolvedUrl("view/login/PhoneNumberView.qml"), { "context": context });
            });
        }
    }

    function openGroupDialog(ischannel) {
        var component = Qt.createComponent("dialogs/CreateGroupDialog.qml");
        var dlgcreategroup = component.createObject(applicationwindow, { context: applicationwindow.context, isChannel: ischannel });
        dlgcreategroup.open();
    }

    id: applicationwindow
    visible: true
    x: 550
    y: 200
    width: 900
    height: 600
    title: qsTr("QtGram")

    ThemeMenuBar
    {
        id: topbar
        anchors { left: parent.left; top: parent.top; right: parent.right }

        model: ListModel {
            ListElement { text: qsTr("Telegram"); value: 0 }
            ListElement { text: qsTr("Contacts"); value: 1 }
            ListElement { text: qsTr("Settings"); value: 2 }
            ListElement { text: qsTr("Debug"); value: 3 }
            ListElement { text: qsTr("Info"); value: 4 }
        }

        onMenuClicked: {
            var component = null;

            if(value === 0) {
                component = Qt.createComponent("dialogs/CreateDialog.qml");
                var dlgcreate = component.createObject(applicationwindow, { context: applicationwindow.context });
                dlgcreate.createGroup.connect(applicationwindow.openGroupDialog);
                dlgcreate.open()
            }
            else if(value === 1) {
                component = Qt.createComponent("dialogs/ContactsDialog.qml");
                var dlgcontacts = component.createObject(applicationwindow, { context: applicationwindow.context });
                dlgcontacts.open()
            }
            else if(value === 3) {
                component = Qt.createComponent("dialogs/DebugDialog.qml");
                var dlgdebug = component.createObject(applicationwindow);
                dlgdebug.open()

            }
        }
    }

    Loader
    {
        id: loader
        anchors { left: parent.left; top: topbar.bottom; right: parent.right; bottom: parent.bottom }
    }
}
