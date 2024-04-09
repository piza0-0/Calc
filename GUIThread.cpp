#include "GUIThread.h"
#include "ui_GUIThread.h"


GUIThread::GUIThread(QQueue<QString>& que_Request, QMutex& mtx_Request, QWaitCondition& cond_Request,QWidget *parent)
    : QMainWindow(parent),
    m_que_Request(&que_Request), m_mtx_Request(&mtx_Request), m_cond_Request(&cond_Request),
    ui(new Ui::GUIThread)
{
    ui->setupUi(this);
}


GUIThread::~GUIThread()
{
    delete ui;
}

void GUIThread::on_pushButton_clicked()
{
    m_mtx_Request->lock();
    m_que_Request->enqueue(msg);
    qDebug() << "main put task..." << '\n';
    m_cond_Request->wakeOne();
    m_mtx_Request->unlock();

}



