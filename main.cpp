#include "MainWindow.h"
#include "ThreadWorker.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QMutex mtx;
    QWaitCondition cond;
    QQueue<QString> qu;
    MainWindow w(qu, mtx, cond);
    ThreadWorker thrWorker(qu, mtx, cond);
    thrWorker.start();
    w.show();    
    return a.exec();
}
