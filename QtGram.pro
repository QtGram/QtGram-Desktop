QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    qtgram.cpp \
    theme.cpp \
    debugcaller.cpp

RESOURCES += \
    resources.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

INCLUDEPATH += $$PWD/../LibQTelegram
LIBS += -L$$OUT_PWD/../build-LibQTelegram-Desktop-Debug -lQTelegram

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    qml/qtgram.qml \
    qml/model/Context.qml \
    qml/js/Settings.js \
    qml/js/CountryList.js \
    qml/view/login/PhoneNumberView.qml \
    qml/component/ViewContainer.qml \
    qml/view/login/SignUpView.qml \
    qml/view/login/SignInView.qml \
    qml/view/dialog/DialogsView.qml \
    qml/dialogs/ContactsDialog.qml \
    qml/view/subview/PlaceholderView.qml \
    qml/component/DialogHeader.qml \
    qml/component/message/MessageBubble.qml \
    qml/view/subview/MessagesView.qml \
    qml/component/message/MessageText.qml \
    qml/js/Emoji.js \
    qml/js/TextElaborator.js \
    qml/item/DialogModelItem.qml \
    qml/item/ContactModelItem.qml \
    qml/item/MessageModelItem.qml \
    qml/dialogs/CreateDialog.qml \
    qml/component/theme/ThemeListView.qml \
    qml/component/theme/ThemeButton.qml \
    qml/component/theme/ThemeComboBox.qml \
    qml/component/theme/ThemeFrame.qml \
    qml/component/theme/ThemeTextField.qml \
    qml/component/theme/menu/ThemeMenuBar.qml \
    qml/component/message/MessageTextInput.qml \
    qml/dialogs/DebugDialog.qml \
    qml/component/message/MessageStatus.qml \
    qml/component/message/media/AnimatedMessage.qml \
    qml/component/message/media/ImageMessage.qml \
    qml/component/message/media/LocationMessage.qml \
    qml/component/message/media/WebPageMessage.qml \
    qml/component/message/media/FileMessage.qml \
    qml/component/message/reply/MessageReplyItem.qml \
    qml/component/message/MessageQuote.qml \
    qml/component/message/reply/MessageReplyImage.qml \
    qml/dialogs/chat/CreateChatDialog.qml \
    qml/component/view/ContactList.qml \
    qml/component/theme/listview/ThemeListItem.qml \
    qml/component/theme/listview/ThemeListMenuItem.qml \
    qml/component/theme/listview/ThemeListMenu.qml \
    qml/js/Colors.js \
    qml/view/login/TwoFactorView.qml \
    qml/view/FloodLockView.qml \
    qml/component/message/NewMessage.qml \
    qml/component/message/FirstMessageButton.qml \
    qml/component/ConnectionStatus.qml

HEADERS += \
    qtgram.h \
    theme.h \
    debugcaller.h
