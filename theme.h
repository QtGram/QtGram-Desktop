#ifndef THEME_H
#define THEME_H

#include <QObject>
#include <QColor>

class Theme : public QObject
{
    Q_OBJECT

    Q_PROPERTY(qreal paddingSmall READ paddingSmall CONSTANT FINAL)
    Q_PROPERTY(qreal paddingMedium READ paddingMedium CONSTANT FINAL)
    Q_PROPERTY(qreal paddingLarge READ paddingLarge CONSTANT FINAL)
    Q_PROPERTY(qreal fontSizeSmall READ fontSizeSmall CONSTANT FINAL)
    Q_PROPERTY(qreal fontSizeMedium READ fontSizeMedium CONSTANT FINAL)
    Q_PROPERTY(qreal fontSizeLarge READ fontSizeLarge CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeExtraSmall READ itemSizeExtraSmall CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeSmall READ itemSizeSmall CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeMedium READ itemSizeMedium CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeLarge READ itemSizeLarge CONSTANT FINAL)
    Q_PROPERTY(QColor primaryColor READ primaryColor CONSTANT FINAL)
    Q_PROPERTY(QColor highlightColor READ highlightColor CONSTANT FINAL)

    public:
        explicit Theme(QObject *parent = 0);
        qreal paddingSmall() const;
        qreal paddingMedium() const;
        qreal paddingLarge() const;
        qreal fontSizeSmall() const;
        qreal fontSizeMedium() const;
        qreal fontSizeLarge() const;
        qreal itemSizeExtraSmall() const;
        qreal itemSizeSmall() const;
        qreal itemSizeMedium() const;
        qreal itemSizeLarge() const;
        QColor primaryColor() const;
        QColor highlightColor() const;
};

#endif // THEME_H
