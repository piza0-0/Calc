#ifndef CALCTHREAD_H
#define CALCTHREAD_H

#include "GUIThread.h"
#include "Calculator.h"

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
                        QObject *parent = nullptr);
    ~CalcThread();

    void run() override;

    void stop();

    void stopWaiting();

signals:
    void resultIsReady();
    void calcError(QString expression, QString errorLog);


private:
     QQueue<QString>* m_que_Request;
     QMutex* m_mtx_Request;
     QWaitCondition* m_cond_Request;

     QQueue<QPair<QString, double>>* m_que_Result;
     QMutex* m_mtx_Result;
     QWaitCondition* m_cond_Result;

     Calucator calc;
     GUIThread *m_gui_Thread;
     bool m_stopRequested = false;
};

#endif // CALCTHREAD_H
