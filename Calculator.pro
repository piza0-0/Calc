QT       += core gui quick qml

#greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    Backend/CalcThread.cpp \
    Backend/Calculator.cpp \
    Backend/GUIThread.cpp \
    Backend/main.cpp

HEADERS += \
    Backend/CalcThread.h \
    Backend/Calculator.h \
    Backend/GUIThread.h


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

RESOURCES += \
    Frontend/Resources.qrc

unix:!macx: LIBS += -L$$PWD/Lib/bin/ -lCalcLib

INCLUDEPATH += $$PWD/Lib/bin
DEPENDPATH += $$PWD/Lib/bin

QML_IMPORT_PATH += $$PWD/Frontend
