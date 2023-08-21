//GLOW
import QtQuick
import Qt5Compat.GraphicalEffects
import "./Components"

Rectangle {
    id: home
    width: Window.width
    height: Window.height
    color: "black"
    radius: 40

    SideBar{}

    ProfileWidget{
        z:20
    }

    Image {
        id: background
        width: parent.width - 80
        height: parent.height - 10
        anchors{
            right: parent.right
            rightMargin: 10
            verticalCenter: parent.verticalCenter
        }
        source: 'qrc:/src/images/background.png' ////background_music //background2


        Image{
            width: parent.width
            height: parent.height
            source: "qrc:/src/images/rect_blur.png"
            anchors.centerIn: parent
        }
        DoorWidget{
            id: front_door1
            width: Window.width * 0.28//250
            height: Window.height * 0.45//210
            anchors{
                left: background.left //left works with width, top works with height
                top: parent.top
                topMargin: Window.height * 0.04
            }
            deviceName: "FRONT DOOR"

        }
        DoorWidget{
            id: kitchen_door
            width: Window.width * 0.28//250
            anchors{
                left: front_door1.right
                top: parent.top
                topMargin: Window.height * 0.04
            }
            deviceName: "KITCHEN DOOR"
        }
        DoorWidget{
            id: garage_door
            deviceName: "GARAGE DOOR"
            anchors{
                left: kitchen_door.right
                top: parent.top
                topMargin: Window.height * 0.04
            }
        }
        DoorWidget{
            id:gate
            width: Window.width * 0.28//250
            anchors{
                top: front_door1.bottom
                left: background.left
                leftMargin: Window.width * 0.1
            }
            deviceName: "GATE"
        }
        DoorWidget{
            id: home_alarm
            anchors{
                top: front_door1.bottom
                left: gate.right
            }
            deviceName: "HOME ALARM"
        }
    }
}


//APIs gotten frm
//https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-rectangularglow.html
