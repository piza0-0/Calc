import QtQuick 2.5


MyButtonStyle{
    id: but

   background: Rectangle {
    property string normalColor: "#005291"
    property string hoveredColor: "#4587ba"
    property string pressedColor: "#002948"
    implicitWidth: 100
    radius: 20
    implicitHeight: 50
    color: but.pressed ? pressedColor :
           but.hovered ? hoveredColor :
                                normalColor
}

contentItem: Text {
    text: but.text
    color: "#ffffff"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.pointSize: 15
    font.bold: true
}
}
