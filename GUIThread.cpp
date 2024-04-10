#include "GUIThread.h"
#include "ui_GUIThread.h"


GUIThread::GUIThread(QQueue<QString>& que_Request, QMutex& mtx_Request,
                     QWaitCondition& cond_Request, QQueue<QString>& que_Result,
                     QMutex& mtx_Result, QWaitCondition& cond_Result, QWidget *parent)
    : QMainWindow(parent),
      m_que_Request(&que_Request), m_mtx_Request(&mtx_Request),
      m_cond_Request(&cond_Request), m_que_Result(&que_Result),
      m_mtx_Result(&mtx_Result), m_cond_Result(&cond_Result),
      ui(new Ui::GUIThread)
{
    ui->setupUi(this);

}


GUIThread::~GUIThread()
{
    delete ui;
}

void GUIThread::on_resultIsReady()
{
    blockSignals(true);
    m_mtx_Result->lock();
    QString msq = m_que_Result->dequeue();
    m_mtx_Result->unlock();

    qDebug() << msg << " 2-ая очередь"<<'\n';
    blockSignals(false);
}

void GUIThread::on_pushButton_clicked()
{
    m_mtx_Request->lock();
    m_que_Request->enqueue(msg);
    qDebug() << "main put task..." << '\n';
    m_cond_Request->wakeOne();
    m_mtx_Request->unlock();

}



