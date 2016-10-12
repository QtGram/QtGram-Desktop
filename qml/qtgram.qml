import QtQuick 2.7
import QtQuick.Controls 1.4
import "component/topbar"
import "dialogs"
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

    ContactsDialog { id: contactsdialog; context: applicationwindow.context }

    id: applicationwindow
    visible: true
    x: 550
    y: 200
    width: 900
    height: 600
    title: qsTr("QtGram")

    TopBar
    {
        id: topbar
        anchors { left: parent.left; top: parent.top; right: parent.right }
        onContactsRequested: contactsdialog.open()
    }

    Loader
    {
        id: loader
        anchors { left: parent.left; top: topbar.bottom; right: parent.right; bottom: parent.bottom }
    }
}
