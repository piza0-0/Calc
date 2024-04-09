#include "GUIThread.h"
#include "CalcThread.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QMutex mtx_Request;
    QWaitCondition cond_Request;
    QQueue<QString> que_Request;

//    QMutex mtx_Result;
//    QWaitCondition cond_Result;
//    QQueue<QString> que_Result;

    GUIThread w(que_Request, mtx_Request, cond_Request);
    CalcThread calc_Thread(que_Request, mtx_Request, cond_Request);
    calc_Thread.start();

    w.show();    
    return a.exec();
}
