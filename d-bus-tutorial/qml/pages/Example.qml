import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.DBus 2.0

//D-Bus — система межпроцессного взаимодействия,
//которая позволяет приложениям сообщаться друг с другом.
//Кроме того, система D-Bus облегчает управление жизненным циклом процессов.
//С её помощью можно просто и надёжно создавать приложения,
//запускаемые в единственном экземпляре,
//а также запускать приложения и демоны по запросу


// D-bus  помогает : управлять настройками, что то открыть
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
Page {
    id: page
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property string deviceModel
    property string osVersion

    PageHeader { title: qsTr("D-Bus Client")}

    DBusInterface
    {
        id: deviceinfoFeatures

        service: "ru.omp.deviceinfo"
        path:    "/ru/omp/deviceinfo/Features"
        iface:   "ru.omp.deviceinfo.Features"
    }

    Component.onCompleted:
    {
        deviceinfoFeatures.call("getOsVersion", [],
                                function(resault) { osVersion =resault;});
        deviceinfoFeatures.call("getDeviceModel", [],
                                function(resault) { deviceModel =resault;});
    }

    onOsVersionChanged: console.log(osVersion)
    onDeviceModelChanged: console.log(deviceModel)
}
