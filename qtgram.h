#ifndef QTGRAM_H
#define QTGRAM_H

#include <QObject>

class QtGram : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString publicKey READ publicKey CONSTANT FINAL)
    Q_PROPERTY(QString emojiPath READ emojiPath CONSTANT FINAL)

    public:
        explicit QtGram(QObject *parent = 0);
        QString publicKey() const;
        QString emojiPath() const;
};

#endif // QTGRAM_H
