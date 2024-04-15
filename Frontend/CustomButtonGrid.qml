import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.15


GridLayout{
    id: custgrid
    columns: 4
    rows: 5
    //    anchors{
    //        bottomMargin: 10
    //        leftMargin: 20
    //        rightMargin: 40
    //    }

    Item{
        id: it1
        //Layout.fillHeight: true
        implicitHeight: 50
        Layout.fillWidth: true
        Layout.column: 0
        Layout.row: 4
        Layout.columnSpan: 2
        TextField {
            id: txtinput
            anchors.fill: parent
            placeholderText: qsTr("Enter expression")

            background: Rectangle {
                radius: 15
                color: "#918d8d"
                implicitWidth: 100
                implicitHeight: 40
                border.color: "#333"
                border.width: 1
            }

            validator: RegExpValidator { regExp: /[0-9\+\.\-\*\/]*/ }
            //horizontalAlignment: Text.AlignRight
            onAccepted: {
                if(canUseEqual){
                    equalButtonClicked(txtinput.text)
                    txtinput.clear()
                    canUseEqual = 0
                    timer.start()
                }
            }

        }
    }

    Item{
        //Layout.maximumWidth: maxsize
        //Layout.fillHeight: true
        implicitHeight: 50
        Layout.fillWidth: true
        Layout.column: 2
        Layout.row: 4
        RoundButton{
            id: undo
            anchors.fill: parent
            text: "<-"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.remove(txtinput.length, txtinput.length-1)
                }
            }
        }
    }

    //кнопки чисел
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 0
        Layout.row: 0
        RoundButton{
            id: but7
            anchors.fill: parent
            text: "7"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                id: but7M
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"7")
                }
            }
        }
    }
    Item{


        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 1
        Layout.row: 0

        RoundButton{
            id: but8
            anchors.fill: parent
            text: "8"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"8")
                }
            }
        }
    }
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 2
        Layout.row: 0

        RoundButton{
            id: but9
            anchors.fill: parent
            text: "9"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"9")
                }
            }

        }
    }
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 0
        Layout.row: 1

        RoundButton{
            id: but4
            anchors.fill: parent
            text: "4"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"4")
                }
            }

        }
    }
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 1
        Layout.row: 1

        RoundButton{
            id: but5
            anchors.fill: parent
            text: "5"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"5")
                }
            }
        }
    }
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 2
        Layout.row: 1

        RoundButton{
            id: but6
            anchors.fill: parent
            text: "6"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"6")
                }
            }
        }
    }
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 0
        Layout.row: 2

        RoundButton{
            id: but1
            anchors.fill: parent
            text: "1"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"1")
                }
            }
        }
    }
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 1
        Layout.row: 2

        RoundButton{
            id: but2
            anchors.fill: parent
            text: "2"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"2")
                }
            }
        }
    }
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 2
        Layout.row: 2

        RoundButton{
            id: but3
            anchors.fill: parent
            text: "3"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"3")
                }
            }
        }
    }
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.columnSpan: 2
        Layout.column: 0
        Layout.row: 3

        RoundButton{
            id: but0
            anchors.fill: parent
            text: "0"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"0")
                }
            }
        }
    }
    //кнопки знаков
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 2
        Layout.row: 3

        RoundButton{
            id: butComma
            anchors.fill: parent
            text: "."
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,".")
                }
            }
        }
    }    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 3
        Layout.row: 3

        RoundButton{
            id: minus
            anchors.fill: parent
            text: "-"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"-")
                }
            }
        }
    }
    Item{
        Layout.fillWidth: true
        Layout.column: 3
        Layout.row: 4
        implicitHeight: 50
        RoundButton{
            id: butEqual
            anchors.fill: parent
            text: "="
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            onClicked:{
                if(canUseEqual){
                    equalButtonClicked(txtinput.text)
                    txtinput.clear()
                    canUseEqual = 0
                    timer.start()
                }
            }
        }
    }
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 3
        Layout.row: 2

        RoundButton{
            id: plus
            anchors.fill: parent
            text: "+"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"+")
                }
            }
        }
    }
    Item{

        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 3
        Layout.row: 1

        RoundButton{
            id: dev
            anchors.fill: parent
            text: "/"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"/")
                }
            }
        }
    }
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.column: 3
        Layout.row: 0

        RoundButton{
            id: mult
            anchors.fill: parent
            text: "×"
            contentItem: Text {
                text: parent.text
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 15
                font.bold: true
            }
            background: Rectangle {
                property string normalColor: "#545454"
                property string hoveredColor: "#4587ba"
                property string pressedColor: "#002948"
                implicitWidth: 100
                implicitHeight: 50
                radius: 30
                color: parent.pressed ? pressedColor :
                       parent.hovered ? hoveredColor :
                                            normalColor
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txtinput.insert(txtinput.length,"*")
                }
            }
        }
    }

}
