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

QColor Theme::primaryColor() const
{
   return ColorPalette.text().color();
}

QColor Theme::highlightColor() const
{
   return ColorPalette.highlight().color();
}
