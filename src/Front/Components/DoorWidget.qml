import QtQuick
import Qt5Compat.GraphicalEffects


Item {
    id: door
    property string deviceName: "FRONT DOOR"
    property string lockStatus: "Locked"


    FontLoader {
        id: customFont1
        source: "qrc:/content/fonts/Lobster-Regular.ttf"
    }

    Image{
        id: front_door_bg
        width: Window.width * 0.28//250
        height: Window.height * 0.45//210
        z:1
        source: "qrc:/src/images/front_door_bg.png"

        SequentialAnimation{
            id: seqdoor
            //running: true
            loops: Animation.Infinite

            PropertyAnimation {
                id: zoomAnimation
                target: front_door_bg
                property: "scale"
                to: 1.2
                duration: 200
            }
            PropertyAnimation {
                id: zoomAnimationEnd
                target: front_door_bg
                property: "scale"
                to: 1.0
                duration: 200
            }
        }


//        transform: Rotation {
//            id: swivelRotation
//            angle: 0
//            origin.x: swivelRect.width / 2
//            origin.y: swivelRect.height / 2
//        }

//        Behavior on angle {
//            NumberAnimation {
//                duration: 1000
//            }
//        }


        Text{
            id: title
            text: "<b>" + deviceName + "</b>"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#FFFFFF"
            anchors.top: parent.top
            anchors.topMargin: Window.height * 0.1//100
        }

        Image{
            id: slider_back
            width: Window.width * 0.25//200
            height: Window.height * 0.23//100
            z:2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: Window.height * 0.025//15
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/src/images/slider_inner.png"

            Text{
                id: title2
                text: lockStatus
                color: "#d9ddd4"
                font: customFont1.font
                //font.pointSize: 8
                anchors{
                    top: slider_back.top
                    topMargin: 0
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Image{
                id: slider_button
                source: "qrc:/src/images/slider_button.png"
                anchors.left: slider_back.left
                anchors.leftMargin: Math.round(Window.width * 0.05)
                anchors.verticalCenter: parent.verticalCenter
                width: 60
                height: 60
                //x: 35 //105

                function sliderControl(){
                    //slider_button.anchors.leftMargin = (slider_button.anchors.leftMargin === 25) ? 115 : 25
                    if (slider_button.anchors.leftMargin === Math.round(Window.width * 0.05)) {
                        slider_button.anchors.leftMargin = Math.round(Window.width * 0.15);
                        slider_lock.opacity = 0.4
                        slider_unlock.opacity = 0
                        lockStatus = "Unlocked"
                        slider_button.source =  "qrc:/src/images/slider_button_green.png"
                        seqdoor.start()
                    }
                    else {
                        slider_button.anchors.leftMargin = Math.round(Window.width * 0.05);
                        slider_lock.opacity = 0
                        slider_unlock.opacity = 0.4
                        lockStatus = "Locked"
                        slider_button.source =  "qrc:/src/images/slider_button.png"
                        seqdoor.stop()
                    }
                }

                Behavior on anchors.leftMargin {
                    NumberAnimation {
                        duration: 400 // Animation duration in milliseconds
                    }
                }

                MouseArea {
                    width: slider_button.width
                    height: slider_button.height
                    onClicked: {
                        slider_button.sliderControl()
                        //slider_button.anchors.leftMargin = (slider_button.anchors.leftMargin === 25) ? 115 : 25
                    }
                }
            }
            Image{
                id: slider_lock
                source: "qrc:/src/images/slider_lock.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: Math.round(Window.width * 0.05)//34
                width: 40
                height: 40
                opacity: 0

                Behavior on opacity {
                    NumberAnimation {
                        duration: 500 // Animation duration in milliseconds
                    }
                }
            }
            Image{
                id: slider_unlock
                source: "qrc:/src/images/slider_unlock.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: Window.width * 0.05
                width: 40
                height: 40
                opacity: 0.4


                Behavior on visible {
                    NumberAnimation {
                        duration: 500 // Animation duration in milliseconds
                    }
                }
            }
        }
    }
}
