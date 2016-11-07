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
    Q_PROPERTY(qreal fontSizeExtraLarge READ fontSizeExtraLarge CONSTANT FINAL)
    Q_PROPERTY(qreal fontSizeHuge READ fontSizeHuge CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeExtraSmall READ itemSizeExtraSmall CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeSmall READ itemSizeSmall CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeMedium READ itemSizeMedium CONSTANT FINAL)
    Q_PROPERTY(qreal itemSizeLarge READ itemSizeLarge CONSTANT FINAL)
    Q_PROPERTY(qreal defaultWidth READ defaultWidth CONSTANT FINAL)
    Q_PROPERTY(qreal defaultHeight READ defaultHeight CONSTANT FINAL)

    Q_PROPERTY(qreal colorSweep READ colorSweep CONSTANT FINAL)

    Q_PROPERTY(QColor backgroundColor READ backgroundColor CONSTANT FINAL)
    Q_PROPERTY(QColor textColor READ textColor CONSTANT FINAL)
    Q_PROPERTY(QColor mainColor READ mainColor CONSTANT FINAL)
    Q_PROPERTY(QColor alternateMainColor READ alternateMainColor CONSTANT FINAL)
    Q_PROPERTY(QColor mainTextColor READ mainTextColor CONSTANT FINAL)
    Q_PROPERTY(QColor placeholderTextColor READ placeholderTextColor CONSTANT FINAL)

    public:
        explicit Theme(QObject *parent = 0);

    public: // Metrics
        qreal paddingSmall() const;
        qreal paddingMedium() const;
        qreal paddingLarge() const;
        qreal fontSizeSmall() const;
        qreal fontSizeMedium() const;
        qreal fontSizeLarge() const;
        qreal fontSizeExtraLarge() const;
        qreal fontSizeHuge() const;
        qreal itemSizeExtraSmall() const;
        qreal itemSizeSmall() const;
        qreal itemSizeMedium() const;
        qreal itemSizeLarge() const;
        qreal defaultWidth() const;
        qreal defaultHeight() const;

    public: // Color transformation
        qreal colorSweep() const;

    public: // Colors
        QColor backgroundColor() const;
        QColor textColor() const;
        QColor mainColor() const;
        QColor alternateMainColor() const;
        QColor mainTextColor() const;
        QColor placeholderTextColor() const;
};

#endif // THEME_H
