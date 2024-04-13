import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick 2.12
import Qt.labs.qmlmodels 1.0
import TableModel 1.0
import QtQuick.Layouts 1.1


Window {
    id: root
    width: 450
    height: 600
    visible: true
    title: qsTr("Hello World")

    TableView {
        id: tv
        //        anchors.fill: parent
        width: parent.width
        height: parent.height/2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: TableModel {}

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


}
