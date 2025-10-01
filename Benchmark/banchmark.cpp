#include <QObject>
#include <QTest>

struct Setting
{
    Setting(QString name, double size, QDateTime time, QString shortName, QStringList changes)
        : name(std::move(name)),
          size(size),
          time(std::move(time)),
          shortName(std::move(shortName)),
          changes(std::move(changes))
    {

    }

    QString name;
    double size;
    QDateTime time;
    QString shortName;
    QStringList changes;
};

struct SettingCopy
{
    SettingCopy(const QString& name, double size, const QDateTime& time, const QString& shortName, const QStringList& changes)
        : name(name),
          size(size),
          time(time),
          shortName(shortName),
          changes(changes)
    {

    }

    QString name;
    double size;
    QDateTime time;
    QString shortName;
    QStringList changes;
};

struct Banchmark : public QObject
{
    Q_OBJECT

private slots:
    void copy_constructor();
    void value_constructor();
};


void Banchmark::value_constructor()
{
    QString name;
    QString shortName;
    QStringList list;
    for(int i = 0; i < 1000000; ++i)
    {
        QString str("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAA");
        name.push_back(str);
        shortName.push_back(str);
        list.push_back(str);
    }

    QBENCHMARK{
        Setting s(std::move(name), 5.6, QDateTime::currentDateTime(), std::move(shortName), std::move(list));
        Q_UNUSED(s)
    }
}

void Banchmark::copy_constructor()
{
    QString name;
    QString shortName;
    QStringList list;
    for(int i = 0; i < 1000000; ++i)
    {
        QString str("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAA");
        name.push_back(str);
        shortName.push_back(str);
        list.push_back(str);
    }

    QBENCHMARK{
        SettingCopy s(name, 5.6, QDateTime::currentDateTime(), shortName, list);
        Q_UNUSED(s)
    }
}
QTEST_MAIN(Banchmark)
#include "banchmark.moc"
