#ifndef CALCTHREAD_H
#define CALCTHREAD_H

#include <QThread>
#include <QMutex>
#include <QWaitCondition>
#include <QQueue>
#include <QDebug>


class CalcThread : public QThread
{
    Q_OBJECT
public:

    explicit CalcThread(QQueue<QString>& que_Request, QMutex& mtx_Request, QWaitCondition& cond_Request, QObject *parent = nullptr);
    ~CalcThread();
    void run() override;

    void stop();

    void stopWaiting();

private:
     QQueue<QString>* m_que_Request;
     QMutex* m_mtx_Request;
     QWaitCondition* m_cond_Request;

     bool m_stopRequested = false;
};

#endif // CALCTHREAD_H
