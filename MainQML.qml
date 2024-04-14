import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick 2.12
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2 as C1
import QtQuick.Controls 2.15 as C215


Window {
    id: root
    width: 450
    height: 600
    visible: true

    signal equalButtonClicked(string msg)
    signal setSleepTime(string sleepTime)

    property int requestsNumberLeft: 0

    title: qsTr("Калькулятор")

    TableView {
        id: tv
        //        anchors.fill: parent
        width: parent.width
        height: parent.height/2
        anchors.top: toolBar.bottom
        //anchors.topMargin: status.height
        anchors.horizontalCenter: parent.horizontalCenter
        //columnSpacing: 1
        //rowSpacing: 1
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
            color: "grey"
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

    CustomButtonGrid{
        id: custgrid
        Layout.maximumWidth: 1000
        width: root.width
        height: root.height/2
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
        }

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
        color: "darkgrey"
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
                color: "grey"

            }
            C1.Label{

                //Layout.fillHeight: true
                Layout.alignment: Qt.AlignRight
                text: "DLL lib"
            }


            C215.CheckBox{
                enabled: true
                Layout.alignment: Qt.AlignRight
                implicitHeight: toolBar.height
                implicitWidth: toolBar.height
            }
        }

    }




    Component.onCompleted: {
        equalButtonClicked.connect(gui_thread.on_equalButtonClicked)
        setSleepTime.connect(clac_thread.on_setSleepTime)
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
