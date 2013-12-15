TEMPLATE = app
#CONFIG  += plugin
#CONFIG += release
include(alquds.pri)
include(qtsingleapplication/src/qtsingleapplication.pri)

win32:RC_FILE = winapp.rc

win32{
    CONFIG(debug, debug|release) {
        DESTDIR = $$PWD/../install_($$QT_VERSION)_debug
    } else {
        DESTDIR = $$PWD/../install_($$QT_VERSION)_release
    }
}
unix{
    CONFIG(debug, debug|release) {
        DESTDIR = $$PWD/../install_($$QT_VERSION)_debug
    } else {
        DESTDIR = $$PWD/../install_($$QT_VERSION)_release
    }
}


win32: LIBS += -L$$PWD/../WinSparkle/ -lWinSparkle

INCLUDEPATH += $$PWD/../WinSparkle
DEPENDPATH += $$PWD/../WinSparkle

win32: PRE_TARGETDEPS += $$PWD/../WinSparkle/WinSparkle.lib
