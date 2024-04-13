import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick 2.12
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2 as C1

Window {
    id: root
    width: 450
    height: 600
    visible: true

    signal equalButtonClicked(string msg)

    property int requestsNumberLeft: 0

    title: qsTr("Калькулятор")

    TableView {
        id: tv
        //        anchors.fill: parent
        width: parent.width
        height: parent.height/2
        anchors.top: parent.top
        anchors.topMargin: status.height
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

    Component.onCompleted: {
        equalButtonClicked.connect(gui_thread.on_equalButtonClicked)
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
