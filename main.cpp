#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <autogenerated/telegramqml.h>
#include "qtgram.h"
#include "theme.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    app.setApplicationName("QtGram");
    app.setWindowIcon(QIcon("://res/app.png"));

    TelegramQml::initialize("LibQTelegram");
    qmlRegisterType<QtGram>("QtGram", 1, 0, "QtGram");

    QQmlApplicationEngine engine;

    Theme theme;
    engine.rootContext()->setContextProperty("Theme", &theme);
    engine.load(QUrl(QLatin1String("qml/qtgram.qml")));

    return app.exec();
}
