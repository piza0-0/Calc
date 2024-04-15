#ifndef CALCTHREAD_H
#define CALCTHREAD_H

#include "Backend/GUIThread.h"
#include "Backend/Calculator.h"

#include <QObject>
#include <QThread>
#include <QMutex>
#include <QWaitCondition>
#include <QQueue>
#include <QDebug>
#include <stdexcept>

class CalcThread : public QThread
{
    Q_OBJECT

public:

    explicit CalcThread(QQueue<QString>& que_Request, QMutex& mtx_Request,
                        QWaitCondition& cond_Request, QQueue<QPair<QString, double>>& que_Result,
                        QMutex& mtx_Result, QWaitCondition& cond_Result, GUIThread& gui_Thread,
                        QThread *parent_tread = nullptr);

    ~CalcThread();

    void run() override;

    void stop();

    void stopWaiting();

public slots:
    void on_setSleepTime(QString sleepTime);

signals:
    void resultIsReady();
    void calcError(QString expression, QString errorLog);
    void requestsNumberLeft(int left);

private:
     QQueue<QString>* m_que_Request;
     QMutex* m_mtx_Request;
     QWaitCondition* m_cond_Request;

     QQueue<QPair<QString, double>>* m_que_Result;
     QMutex* m_mtx_Result;
     QWaitCondition* m_cond_Result;

     Calculator calc;
     GUIThread *m_gui_Thread;
     bool m_stopRequested = false;
     int m_sleepTime = 1;

};

#endif // CALCTHREAD_H
