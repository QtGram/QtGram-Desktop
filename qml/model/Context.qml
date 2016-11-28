import QtQuick 2.4
import QtQuick.Controls 1.4
import QtGram 1.0
import LibQTelegram 1.0
import "../js/Settings.js" as Settings

Item
{
    readonly property int apiId: 27782
    readonly property string apiHash: "5ce096f34c8afab871edce728e6d64c9"
    readonly property string hereAppId: "MqR7KyY6dZpTbKiFwc3h"
    readonly property string hereAppCode: "zfYp6V9Ou_wDQn4NVqMofA"

    property StackView stackView

    property QtGram qtgram: QtGram { }

    property Telegram telegram: Telegram {
        //autoDownload: true
        online: Qt.application.state === Qt.ApplicationActive

        initializer: TelegramInitializer {
            debugMode: true
            apiId: context.apiId
            apiHash: context.apiHash
            host: "149.154.167.50"
            //host: "149.154.167.40"
            port: 443
            dcId: 2
            publicKey: qtgram.publicKey
        }

        onLoginCompleted: {
            Settings.set("phonenumber", initializer.phoneNumber);
        }
    }

    function locationThumbnail(latitude, longitude, width, height, z) {
        return "https://maps.nlp.nokia.com/mia/1.6/mapview?" + "app_id=" + hereAppId + "&"
                                                             + "app_code=" + hereAppCode + "&"
                                                             + "nord&f=0&poithm=1&poilbl=0&"
                                                             + "ctr=" + latitude + "," + longitude + "&"
                                                             + "w=" + width + "&h=" + height + "&z=" + z;
    }

    property DialogsModel dialogs: DialogsModel {
        telegram: context.telegram
    }

    property ContactsModel contacts: ContactsModel {
        telegram: context.telegram
    }

    property TelegramNotifications notifications: TelegramNotifications {
        telegram: context.telegram
    }

    function openDialog(dialog) {
        stackView.push({ item: Qt.resolvedUrl("../view/subview/MessagesView.qml"),
                         properties: { context: context, dialog: dialog },
                         replace: true });
    }

    id: context
}
