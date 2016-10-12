import QtQuick 2.7
import QtGram 1.0
import LibQTelegram 1.0
import "../js/Settings.js" as Settings

Item
{
    readonly property int apiId: 27782
    readonly property string apiHash: "5ce096f34c8afab871edce728e6d64c9"
    property QtGram qtGram: QtGram { }

    property Telegram telegram: Telegram {
        initializer: TelegramInitializer {
            debugMode: true
            apiId: context.apiId
            apiHash: context.apiHash
            host: "149.154.167.50"
            port: 443
            publicKey: qtGram.publicKey
        }

        onLoginCompleted: {
            Settings.set("phonenumber", initializer.phoneNumber);
        }
    }

    id: context
}
