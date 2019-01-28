ios {
    LIBS += -framework Foundation
    LIBS += -framework MobileCoreServices
    LIBS += -framework LocalAuthentication

    OBJECTIVE_SOURCES += qtfingerprint.mm
}

macx {
    LIBS += -framework Foundation
    LIBS += -framework LocalAuthentication
    OBJECTIVE_SOURCES += qtfingerprint.mm
}

android {
   QT += androidextras
   SOURCES += qtfingerprint_android.cpp
}

SOURCES += \
        qtfingerprint.cpp


HEADERS += \
        qtfingerprint.h


OTHER_FILES += android/Fingerprint.java
