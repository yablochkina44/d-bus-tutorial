import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.DBus 2.0

Page {
PageHeader { title: qsTr("D-Calc") }

DBusAdaptor {
id: caclulator
property int lhs : 6
property int rhs: 3
// property string str: "qwe"
function plus(){
console.log(lhs + rhs);
}
function minus(){
console.log(lhs - rhs);
}
function mult(){
console.log(lhs*rhs);
}
function div(){
console.log(lhs/rhs);
}

service: "ru.auroraos.DBusCalc"
path: "/ru/auroraos/DBusCalc"
iface: "ru.auroraos.DBusCalc"
xml:' <interface name="ru.auroraos.DBusCalc">\n' +
' <method name="plus" >\n' +
' <arg name="lhs" direction="in" type="i"\n'+
' <arg name="rhs" direction="in" type="i"\n'+
' </interface>\n'
}


}













//import QtQuick 2.0
//import Sailfish.Silica 1.0
//import Nemo.DBus 2.0

//Page {

//    PageHeader { title: qsTr("D-Bus Timer")}

//    Timer
//    {
//        id: timer
//        interval: timerAdaptor.interval
//        repeat: true

//        onTriggered: {

//            timerAdaptor.emitSignal("triggered")
//            console.log("triggered")
//        }
//        onRunningChanged: {
//            timerAdaptor.emitSignal("runningChanged", [running])
//            console.log(running)
//        }
//    }

//    DBusAdaptor
//    {
//        id: timerAdaptor

//        property int interval: 1000
//        readonly property bool  running: timer.running

//        function start() {timer.start()}
//        function stop() { timer.stop()}

//        service: "ru.auroraos.DBusTimer"
//        path: "/ru/auroraos/DBusTimer"
//        iface: "ru.auroraos.DBusTimer"

//        xml: ' <interface name = "ru.auroraos.DBusTimer">\n' +
//             ' <property name = "interval" type = "i" access = "readwrite "/> \n' +
//             ' <property name = "running" type = "b" access = "read "/> \n' +
//             ' <signal name = "triggered"/>\n'+
//             ' <signal name = "runningChanged"/>'+
//             ' <arg name = "running" type = "b" />'+
//             ' </signal>\n' +
//             ' <method name = "start" /> \n' +
//             ' <method name = "stop" /> \n' +
//             ' <interface> \n'

//    }



//}
