import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick 2.12
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2 as C1
import QtQuick.Controls 2.15 as C215
import QtQuick 2.6 as C6
import QtQml 2.0


Window {
    id: root
    width: 450
    height: 600
    visible: true

    signal equalButtonClicked(string msg)
    signal setSleepTime(string sleepTime)
    signal useCalcLib(bool useLib)

    property int requestsNumberLeft: 0
    property int canUseEqual: 1

    title: qsTr("Калькулятор")

    TableView {
        id: tv        
        width: parent.width
        height: parent.height/2
        anchors.top: toolBar.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true

        model: TableModel {
            id: tModel
            TableModelColumn { display: "name" }
            TableModelColumn { display: "color" }
        }

        delegate: Rectangle {
            id:deleg
            implicitWidth: root.width/2
            implicitHeight: 50
            color: "#4587ba"
            Text {
                text: display
                anchors.centerIn: deleg
            }
        }
        onWidthChanged: {
            forceLayout()
        }
        columnWidthProvider: function (column) {
            return root.width / 2
        }

    }
    Rectangle{
        id: gridRect
        width: root.width
        height: root.height/2
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }

    }
    CustomButtonGrid{
        id: custgrid
        anchors.fill: gridRect
        anchors.margins: 10
    }



    C1.StatusBar {
        id:status
        RowLayout {
            anchors.fill: parent
            C1.Label {
                id:label
                text: "Запросов осталось: " + requestsNumberLeft
            }

        }
    }


    Rectangle{
        id: toolBar
        width: root.width
        height: 30
        anchors.top: status.bottom
        color: "#918d8d"
        RowLayout{
            spacing: 10
            C1.Label{
                //Layout.fillHeight: true
                Layout.leftMargin: 5
                Layout.rightMargin: 5
                text: "Задержка (sec)"
            }


            C215.ComboBox {
                id: cbox
                implicitHeight: toolBar.height
                implicitWidth: toolBar.width/6
                //Layout.fillHeight: true
                model: ["1", "2", "3", "4", "5",
                    "6","7","8","9","10"]

                onActivated:{
                    setSleepTime(cbox.currentText)
                    console.log(cbox.currentText)
                }
            }

            Rectangle{
                id: separator
                Layout.alignment: Qt.AlignHCenter

                implicitHeight: toolBar.height
                implicitWidth: toolBar.height
                color: "#918d8d"

            }
            C1.Label{

                //Layout.fillHeight: true
                Layout.alignment: Qt.AlignRight
                text: "DLL lib"
            }


            C215.CheckBox{
                id:chBox
                enabled: true
                checked: false
                Layout.alignment: Qt.AlignRight
                implicitHeight: toolBar.height
                implicitWidth: toolBar.height
                onCheckedChanged:{
                    useCalcLib(chBox.checked)
                }
            }
        }

    }

    Timer {
        id: timer
        interval: 1000
        onTriggered: {
            canUseEqual = 1
        }
    }



    Component.onCompleted: {
        equalButtonClicked.connect(gui_thread.on_equalButtonClicked)
        setSleepTime.connect(clac_thread.on_setSleepTime)
        useCalcLib.connect(clac_thread.on_useCalcLib)
    }
    Connections{
        target: gui_thread
        function onResultIsReady(expression,result){
            tModel.insertRow(0, {name: expression+" =", color: result});
        }
        function onRequestsNumberLeft(left){
            requestsNumberLeft = left;
        }
    }
    Connections{
        target: clac_thread
        function onCalcError(expression, errorLog){
            tModel.insertRow(0, {name: expression+" =", color: errorLog});
        }
        function onRequestsNumberLeft(left){
            requestsNumberLeft = left;
        }
    }


}
