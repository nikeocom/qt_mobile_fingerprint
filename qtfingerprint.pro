#-------------------------------------------------
#
# Project created by QtCreator 2019-01-28T03:24:41
#
#-------------------------------------------------

QT       -= gui

TARGET = qtfingerprint
TEMPLATE = lib
CONFIG += staticlib


ios {
    LIBS += -framework Foundation
    LIBS += -framework UIKit
    LIBS += -framework MessageUI
    LIBS += -framework MobileCoreServices
    LIBS += -framework LocalAuthentication

    OBJECTIVE_SOURCES += qtfingerprint_ios.mm
}

macx {
   SOURCES +=  qtfingerprint_osx.cpp
}

android {

   SOURCES += qtfingerprint_android.cpp
}

SOURCES += \
        qtfingerprint.cpp


HEADERS += \
        qtfingerprint.h
unix {
    target.path = /usr/lib
    INSTALLS += target
}
