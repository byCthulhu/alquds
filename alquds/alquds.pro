TEMPLATE = lib
CONFIG  += plugin
#CONFIG += release
include(alquds.pri)

SOURCES += \
    ../alquds/alqudslauncher.cpp

HEADERS += \
    ../alquds/alqudslauncher.h

win32:DESTDIR = $$PWD/../install/plugins
unix:DESTDIR = $$PWD/../install/alquds.app/Contents/plugins