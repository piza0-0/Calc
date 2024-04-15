#include "GUIThread.h"

GUIThread::GUIThread(QQueue<QString>& que_Request, QMutex& mtx_Request,
                     QWaitCondition& cond_Request, QQueue<QPair<QString, double>>& que_Result,
                     QMutex& mtx_Result, QWaitCondition& cond_Result,
                     QObject *parent)
      :QObject(parent),
      m_que_Request(&que_Request), m_mtx_Request(&mtx_Request),
      m_cond_Request(&cond_Request), m_que_Result(&que_Result),
      m_mtx_Result(&mtx_Result), m_cond_Result(&cond_Result)
{

}


GUIThread::~GUIThread()
{
    //delete ui;
}

void GUIThread::on_resultIsReady()
{
    blockSignals(true);
    m_mtx_Result->lock();
    QPair<QString, double> resExpr = m_que_Result->dequeue();
    m_mtx_Result->unlock();

    qDebug() << resExpr.second << " 2-ая очередь"<<'\n';
    blockSignals(false);
    emit resultIsReady(resExpr.first,resExpr.second);

}

void GUIThread::on_equalButtonClicked(QString msg)
{
    m_mtx_Request->lock();
    m_que_Request->enqueue(msg);
    emit requestsNumberLeft(m_que_Request->size());
    qDebug() << "main put task..." << '\n';
    m_cond_Request->wakeOne();
    m_mtx_Request->unlock();
}

//void GUIThread::on_pushButton_clicked()
//{

//}



