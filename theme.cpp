#include "theme.h"
#include <QGuiApplication>
#include <QPalette>
#include <QScreen>
#include <QFont>

#define DevicePixelRatio qApp->primaryScreen()->devicePixelRatio()
#define DefaultFont qApp->font().pointSize()
#define ColorPalette qApp->palette()

Theme::Theme(QObject *parent) : QObject(parent)
{

}

qreal Theme::paddingSmall() const
{
    return 5;
}

qreal Theme::paddingMedium() const
{
    return 10;
}

qreal Theme::paddingLarge() const
{
    return 15;
}

qreal Theme::fontSizeSmall() const
{
    return DefaultFont - 2;
}

qreal Theme::fontSizeMedium() const
{
    return DefaultFont;
}

qreal Theme::fontSizeLarge() const
{
    return DefaultFont + 2;
}

qreal Theme::fontSizeExtraLarge() const
{
    return DefaultFont + 4;
}

qreal Theme::fontSizeHuge() const
{
    return DefaultFont + 6;
}

qreal Theme::itemSizeExtraSmall() const
{
    return 20;
}

qreal Theme::itemSizeSmall() const
{
    return 40;
}

qreal Theme::itemSizeMedium() const
{
    return 60;
}

qreal Theme::itemSizeLarge() const
{
    return 80;
}

qreal Theme::defaultWidth() const
{
    return this->itemSizeSmall() * 4;
}

qreal Theme::defaultHeight() const
{
    return this->itemSizeSmall();
}

qreal Theme::colorSweep() const
{
    return 1.2;
}

QColor Theme::backgroundColor() const
{
    return QColor("white");
}

QColor Theme::itemColor() const
{
    return ColorPalette.color(QPalette::Window);
}

QColor Theme::textColor() const
{
    return QColor("black");
}

QColor Theme::mainColor() const
{
    return QColor("#5fa0c4");
}

QColor Theme::alternateMainColor() const
{
    return QColor("#80c342");
}

QColor Theme::mainTextColor() const
{
    return QColor("white");
}

QColor Theme::placeholderTextColor() const
{
    return QColor("gray");
}
