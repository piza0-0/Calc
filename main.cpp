#include "GUIThread.h"
#include "CalcThread.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

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

    gui_thread.show();
    return a.exec();
}
