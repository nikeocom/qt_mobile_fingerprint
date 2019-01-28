#ifndef QTFINGERPRINT_H
#define QTFINGERPRINT_H

#include <QObject>

class QtFingerprint: public QObject
{
  Q_OBJECT
public:
    QtFingerprint(QObject *parent = nullptr);

    Q_INVOKABLE void start(const QString &reason = QString());
signals:
    void unsupported();
    void authorized();
    void notauthorized();
};

#endif // QTFINGERPRINT_H
