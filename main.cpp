#include "GUIThread.h"
#include "CalcThread.h"

//#include <QApplication>
#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    //QApplication a(argc, argv);

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/MainQML.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    QQueue<QString> que_Request;
    QMutex mtx_Request;
    QWaitCondition cond_Request;

    QQueue<double> que_Result;
    QMutex mtx_Result;
    QWaitCondition cond_Result;

    GUIThread gui_thread(que_Request, mtx_Request, cond_Request,
                         que_Result, mtx_Result, cond_Result);
    CalcThread calc_Thread(que_Request, mtx_Request, cond_Request,
                           que_Result, mtx_Result, cond_Result, gui_thread);

    //connect(calc_Thread, &CalcThread::resultIsReady, gui_thread, &GUIThread::on_resultIsReady);
    calc_Thread.start();

    //gui_thread.show();

    return app.exec();
    //return a.exec();
}
