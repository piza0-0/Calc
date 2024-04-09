#include "MainWindow.h"
#include "ui_MainWindow.h"


MainWindow::MainWindow(QQueue<QString>& qu, QMutex& mtx, QWaitCondition& cond,QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    queueRequests = &qu;
    mtxRequests = &mtx;
    condRequests = &cond;
}


MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    mtxRequests->lock();
    queueRequests->enqueue(msg);
    qDebug() << "main put task..." << '\n';
    condRequests->wakeOne();
    mtxRequests->unlock();

}



