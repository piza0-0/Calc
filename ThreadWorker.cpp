#include "ThreadWorker.h"

ThreadWorker::ThreadWorker(QQueue<QString>& qu, QMutex& mtx, QWaitCondition& cond, QObject *parent)
    : QThread{parent}
{
    queueRequests = &qu;
    mtxRequests = &mtx;
    condRequests = &cond;

}

ThreadWorker::~ThreadWorker()
{
    stop();
    stopWaiting();
    wait();
    mtxRequests->unlock();
    qDebug() << "Worker is dead!" << '\n';

}

void ThreadWorker::run()
{
    while(!m_stopRequested){
        mtxRequests->lock();
        if(queueRequests->isEmpty() && !m_stopRequested){
            condRequests->wait(mtxRequests);
        }
        if (m_stopRequested) {
            break;
        }
        QString msg = queueRequests->dequeue();
        mtxRequests->unlock();
        QThread::sleep(5);
        qDebug( )<< msg << '\n';
    }
}

void ThreadWorker::stop()
{
    m_stopRequested = true;
}

void ThreadWorker::stopWaiting()
{
    QMutexLocker locker(mtxRequests);
            condRequests->wakeAll(); // Пробуждаем все потоки, ожидающие на условии
}
