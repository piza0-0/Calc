#ifndef THREADWORKER_H
#define THREADWORKER_H


#include <QThread>
#include <QMutex>
#include <QWaitCondition>
#include <QQueue>
#include <QDebug>


class ThreadWorker : public QThread
{
    Q_OBJECT
public:

    explicit ThreadWorker(QQueue<QString>& qu, QMutex& mtx, QWaitCondition& cond, QObject *parent = nullptr);
    ~ThreadWorker();
    void run() override;
    void stop();
    void stopWaiting();

private:

     QWaitCondition* condRequests;
     QQueue<QString>* queueRequests;
     QMutex* mtxRequests;
     bool m_stopRequested = false;
};

#endif // THREADWORKER_H
