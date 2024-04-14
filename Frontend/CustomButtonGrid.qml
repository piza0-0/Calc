import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.15

GridLayout {
    id: custgrid
    property int  maxsize: 1000/4
    GridLayout{
        id: grd
        columns: 5
        rows: 5

        Item{
            id: it1
            Layout.maximumWidth: maxsize*4
            //Layout.fillHeight: true
            implicitHeight: 40
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row: 4
            Layout.columnSpan: 3
            TextField {
                id: txtinput
                anchors.fill: parent
                placeholderText: qsTr("Enter expression")
                validator: RegExpValidator { regExp: /[0-9\+\-\*\/]*/ }
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
            implicitHeight: 40
            Layout.fillWidth: true
            Layout.column: 3
            Layout.row: 4
            RoundButton{
                id: undo
                anchors.fill: parent
                text: "⌫"
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
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row: 0
            RoundButton{
                id: but7
                anchors.fill: parent
                text: "7"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"7")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 1
            Layout.row: 0

            RoundButton{
                id: but8
                anchors.fill: parent
                text: "8"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"8")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 2
            Layout.row: 0

            RoundButton{
                id: but9
                anchors.fill: parent
                text: "9"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"9")
                    }
                }

            }
        }
        Item{
            Layout.maximumWidth: maxsize

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row: 1

            RoundButton{
                id: but4
                anchors.fill: parent
                text: "4"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"4")
                    }
                }

            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 1
            Layout.row: 1

            RoundButton{
                id: but5
                anchors.fill: parent
                text: "5"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"5")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 2
            Layout.row: 1

            RoundButton{
                id: but6
                anchors.fill: parent
                text: "6"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"6")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 0
            Layout.row: 2

            RoundButton{
                id: but1
                anchors.fill: parent
                text: "1"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"1")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 1
            Layout.row: 2

            RoundButton{
                id: but2
                anchors.fill: parent
                text: "2"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"2")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 2
            Layout.row: 2

            RoundButton{
                id: but3
                anchors.fill: parent
                text: "3"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"3")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.column: 0
            Layout.row: 3

            RoundButton{
                id: but0
                anchors.fill: parent
                text: "0"
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
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 2
            Layout.row: 3

            RoundButton{
                id: butComma
                anchors.fill: parent
                text: "."
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,".")
                    }
                }
            }
        }
        Item{Layout.maximumWidth: maxsize

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 4
            Layout.row: 2
            Layout.rowSpan: 2

            RoundButton{
                id: butEqual
                anchors.fill: parent
                anchors.rightMargin: 5
                anchors.leftMargin: 5
                text: "="
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
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 3
            Layout.row: 2

            RoundButton{
                id: plus
                anchors.fill: parent
                text: "+"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"+")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 3
            Layout.row: 1

            RoundButton{
                id: minus
                anchors.fill: parent
                text: "-"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"-")
                    }
                }
            }
        }
        Item{
            Layout.maximumWidth: maxsize

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.column: 3
            Layout.row: 0

            RoundButton{
                id: mult
                anchors.fill: parent
                text: "×"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        txtinput.insert(txtinput.length,"*")
                    }
                }
            }
        }


    }


}
