#ifndef GUITHREAD_H
#define GUITHREAD_H

#include <QObject>
#include <QMutex>
#include <QQueue>
#include <QWaitCondition>
#include <QDebug>

//QT_BEGIN_NAMESPACE
//namespace Ui { class GUIThread; }
//QT_END_NAMESPACE

class GUIThread : public QObject
        //: public QMainWindow
{
    Q_OBJECT

public:
    GUIThread(QQueue<QString>& que_Request, QMutex& mtx_Request,
              QWaitCondition& cond_Request, QQueue<QPair<QString, double>>& que_Result,
              QMutex& mtx_Result, QWaitCondition& cond_Result,
              QObject *parent = nullptr);

    ~GUIThread();

signals:
    void resultIsReady(QString expression,double result);
    void requestsNumberLeft(int left);

public slots:
    void on_resultIsReady();
    void on_equalButtonClicked(QString msg);


private:

    QQueue<QString>* m_que_Request;
    QMutex* m_mtx_Request;    
    QWaitCondition* m_cond_Request;
    //QPair<int,double>
    QQueue<QPair<QString, double>>* m_que_Result;
    QMutex* m_mtx_Result;
    QWaitCondition* m_cond_Result;

    QString msg = "Hello buddy";


};
#endif // GUITHREAD_H
