#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMutex>
#include <QQueue>
#include <QWaitCondition>
#include <QDebug>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    friend class ThreadWorker;

    MainWindow(QQueue<QString>& qu, QMutex& mtx, QWaitCondition& cond, QWidget *parent = nullptr);

    ~MainWindow();

private slots:
    void on_pushButton_clicked();

private:

    QQueue<QString>* queueRequests;
    QMutex* mtxRequests;
    QString msg = "Hello buddy";
    QWaitCondition* condRequests;
    Ui::MainWindow *ui;

};
#endif // MAINWINDOW_H
