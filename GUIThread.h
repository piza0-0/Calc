#ifndef GUITHREAD_H
#define GUITHREAD_H

#include <QMainWindow>
#include <QMutex>
#include <QQueue>
#include <QWaitCondition>
#include <QDebug>

QT_BEGIN_NAMESPACE
namespace Ui { class GUIThread; }
QT_END_NAMESPACE

class GUIThread : public QMainWindow
{
    Q_OBJECT

public:
    friend class CalcThread;

    GUIThread(QQueue<QString>& que_Request, QMutex& mtx_Request, QWaitCondition& cond_Request, QWidget *parent = nullptr);

    ~GUIThread();


private slots:
    void on_pushButton_clicked();

private:

    QQueue<QString>* m_que_Request;
    QMutex* m_mtx_Request;
    QString msg = "Hello buddy";
    QWaitCondition* m_cond_Request;
    Ui::GUIThread *ui;

};
#endif // GUITHREAD_H
