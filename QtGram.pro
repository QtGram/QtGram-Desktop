QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    qtgram.cpp \
    theme.cpp

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
    qml/component/PeerImage.qml \
    qml/js/TelegramHelper.js \
    qml/item/DialogItem.qml \
    qml/component/topbar/TopBar.qml \
    qml/component/topbar/TopBarItem.qml \
    qml/dialogs/ContactsDialog.qml \
    qml/item/ContactItem.qml \
    qml/component/listview/StyledListView.qml \
    qml/component/RoundedImage.qml \
    qml/view/subview/PlaceholderView.qml \
    qml/component/DialogHeader.qml \
    qml/item/MessageItem.qml \
    qml/component/message/MessageBubble.qml \
    qml/view/subview/MessagesView.qml \
    qml/component/message/MessageImage.qml

HEADERS += \
    qtgram.h \
    theme.h
