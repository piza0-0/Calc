#include "CalcThread.h"

CalcThread::CalcThread(QQueue<QString>& que_Request, QMutex& mtx_Request,
                       QWaitCondition& cond_Request, QQueue<QPair<QString, double>>& que_Result,
                       QMutex& mtx_Result, QWaitCondition& cond_Result, GUIThread& gui_Thread,
                       QThread *parent)
    : QThread(parent),
      m_que_Request(&que_Request), m_mtx_Request(&mtx_Request),
      m_cond_Request(&cond_Request), m_que_Result(&que_Result),
      m_mtx_Result(&mtx_Result), m_cond_Result(&cond_Result),m_gui_Thread(&gui_Thread)
{
    connect(this, &CalcThread::resultIsReady, m_gui_Thread, &GUIThread::on_resultIsReady);
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

        if (m_stopRequested){
            break;
        }

        QString expression = m_que_Request->dequeue();
        emit requestsNumberLeft(m_que_Request->size());

        m_mtx_Request->unlock();

        double result = 0.0;

        try{
            if(useCalcLib == false){
                result = calc.Calculate(expression);
            }else{
                result = calcLib.Calculate(expression); //использование сторонней библиотеки
            }
        }catch(std::logic_error& e){

            qDebug() << e.what() << '\n';
            QString errorLog = e.what();
            emit calcError(expression, errorLog);
            continue;
        }
        QThread::sleep(sleepTime);
        QPair <QString, double> expResult(expression, result);
        m_mtx_Result->lock();
        m_que_Result->enqueue(expResult);
        m_mtx_Result->unlock();

        emit resultIsReady();
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

void CalcThread::on_setSleepTime(QString sleepTime)
{
    this->sleepTime = sleepTime.toInt();
}

void CalcThread::on_useCalcLib(bool calcLib)
{
    useCalcLib = calcLib;
}
