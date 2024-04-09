#include "CalcThread.h"

CalcThread::CalcThread(QQueue<QString>& que_Request, QMutex& mtx_Request, QWaitCondition& cond_Request, QObject *parent)
    : QThread(parent),
      m_que_Request(&que_Request), m_mtx_Request(&mtx_Request), m_cond_Request(&cond_Request)
{

}

CalcThread::~CalcThread()
{
    stop(); //установка флага в значение 1 для выхода из бесконечного цикла, в котором работает поток
    stopWaiting(); //будим потоки, если ожидают сигнала
    wait(); // ожидание окончания работы потока
    m_mtx_Request->unlock(); //освобождение мьютексов
    qDebug() << "Worker is dead!" << '\n';

}

void CalcThread::run()
{
    while(!m_stopRequested){
        m_mtx_Request->lock();
        if(m_que_Request->isEmpty() && !m_stopRequested){
            m_cond_Request->wait(m_mtx_Request);
        }
        if (m_stopRequested) {
            break;
        }
        QString msg = m_que_Request->dequeue();
        m_mtx_Request->unlock();
        QThread::sleep(1);
        qDebug( )<< msg << '\n';
    }
}

void CalcThread::stop()
{
    m_stopRequested = true;
}

void CalcThread::stopWaiting()
{
    QMutexLocker locker(m_mtx_Request);
    m_cond_Request->wakeAll(); // Пробуждаем все потоки, ожидающие на условии
}
