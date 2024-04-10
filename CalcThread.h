#ifndef CALCTHREAD_H
#define CALCTHREAD_H

#include "GUIThread.h"

#include <QThread>
#include <QMutex>
#include <QWaitCondition>
#include <QQueue>
#include <QDebug>


class CalcThread : public QThread
{
    Q_OBJECT
public:

    explicit CalcThread(QQueue<QString>& que_Request, QMutex& mtx_Request,
                        QWaitCondition& cond_Request, QQueue<QString>& que_Result,
                        QMutex& mtx_Result, QWaitCondition& cond_Result, GUIThread& gui_Thread,
                        QObject *parent = nullptr);
    ~CalcThread();

    void run() override;

    void stop();

    void stopWaiting();

signals:
    void resultIsReady();


private:
     QQueue<QString>* m_que_Request;
     QMutex* m_mtx_Request;
     QWaitCondition* m_cond_Request;

     QQueue<QString>* m_que_Result;
     QMutex* m_mtx_Result;
     QWaitCondition* m_cond_Result;

     GUIThread *m_gui_Thread;
     bool m_stopRequested = false;
};

#endif // CALCTHREAD_H
