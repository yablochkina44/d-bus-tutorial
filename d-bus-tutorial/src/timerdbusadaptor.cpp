#include "timerdbusadaptor.h"
#include <QtDBus/QDBusConnection>
#include <QtDBus/QDBusConnectionInterface>
#include <QtDebug>

TimerDBusAdaptor::TimerDBusAdaptor(QObject *parent) :

QDBusAbstractAdaptor(parent),

m_interval(1000),
m_timerId(0) {

QDBusConnection dbusConnection = QDBusConnection::sessionBus();

        if (!dbusConnection.interface()->isServiceRegistered(QStringLiteral ("ru.auroraos.DBusTimer"))){
        dbusConnection.registerObject(QStringLiteral("/ru/auroraos/DBusTimer"), parent);
        dbusConnection.registerService(QStringLiteral("ru.auroraos.DBusTimer"));
        qDebug() << "new service registered";
    } else {
        qDebug() << "service is taken";
    }
}


int TimerDBusAdaptor::interval() const {
    return m_interval;
}

bool TimerDBusAdaptor::running() const{
    return m_timerId != 0;
}


void TimerDBusAdaptor::setInterval(int interval) {
    if (interval == m_interval)
        return;
    m_interval = interval;
    emit intervalChanged();
    qDebug() << "intervalChanged" << interval;

}

void TimerDBusAdaptor::start() {
    if (m_timerId != 0)
                return;
    m_timerId = startTimer(m_interval);
    if (m_timerId != 0)
        emit runningChanged() ;
    qDebug() << "started";
}

void TimerDBusAdaptor::stop(){
    if (m_timerId == 0)
    return;
    killTimer(m_timerId);
    m_timerId=0;
    emit runningChanged();
    qDebug() << "stopped";
}

void TimerDBusAdaptor::timerEvent(QTimerEvent *event) {
    Q_UNUSED(event)
    emit triggered();
    emit runningChanged();
    qDebug() << "triggered";
}
