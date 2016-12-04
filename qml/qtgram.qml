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
            onSessionPasswordNeeded: loader.setSource(Qt.resolvedUrl("view/login/TwoFactorView.qml"), { "context": context, "hint": hint });
            onLoginCompleted: loader.setSource(Qt.resolvedUrl("view/dialog/DialogsView.qml"), { "context": context });
            onFloodLock: loader.setSource(Qt.resolvedUrl("view/FloodLockView.qml"), { "context": context, "seconds": seconds });
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
        visible: context.telegram.loggedIn

        connectionStatus {
            syncing: context.telegram.syncing
            connected: context.telegram.connected
        }

        model: ListModel {
            ListElement { text: qsTr("Contacts"); value: 0 }
            ListElement { text: qsTr("Settings"); value: 1 }
            ListElement { text: qsTr("Info"); value: 2 }
        }

        onMenuClicked: {
            if(value === 0)
                context.openContacts();
        }
    }

    Loader
    {
        id: loader
        anchors { left: parent.left; top: topbar.bottom; right: parent.right; bottom: parent.bottom }
    }
}
