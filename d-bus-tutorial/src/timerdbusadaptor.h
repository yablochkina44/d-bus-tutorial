#ifndef TIMERDBUSADAPTOR_H
#define TIMERDBUSADAPTOR_H

#include <QtDBus/QDBusAbstractAdaptor>

class TimerDBusAdaptor: public QDBusAbstractAdaptor
{
    Q_OBJECT
    Q_PROPERTY(int interval READ interval WRITE setInterval NOTIFY intervalChanged)
    Q_PROPERTY(bool running READ running NOTIFY runningChanged)
    Q_CLASSINFO("D-Bus Interface", "ru.auroraos.DBusTimer")
    Q_CLASSINFO("D-Bus Introspection", ""
        "<interface name=\"ru.auroraos.DBusTimer\">\n"
        "<property name =\"interval\"type\"i\" access=\"readwrite\"/>\n"
        "<property name =\"running\"type\"b\" access=\"read\"/>\n"
        "<signal name=\"triggered\"/>\n"
        "<signal name=\"runningChanged\">"
        "<arg name=\"running\" type= \"b\"/>"
        "</signal>\n"
        "<method name = \"start\"/>"
        "<method name = \"stop\"/>\n"
        "</interface>\n"
        "")
//Q_CLASSINFO("D-Bus Interface","com.example.dbus.Interface")
public:
    explicit TimerDBusAdaptor(QObject *parent);
    int interval() const;
    bool running() const;

public slots:
    void setInterval(int interval);
    void start();
    void stop();

signals:
    void intervalChanged();
    void runningChanged();
    void triggered();

private:
    int m_interval;
    int m_timerId;

protected:
    void timerEvent(QTimerEvent *event) override;

};



#endif // TIMERDBUSADAPTOR_H
