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
        Text{
            id: title
            text: "<b>" + deviceName + "</b>"
            color: "#FFFFFF"
            //font: customFont1.font
            anchors{
                top: parent.top
                topMargin: 50
                horizontalCenter: parent.horizontalCenter

            }
        }

        Image{
            id: slider_back
            width: Window.width * 0.25//200
            height: Window.height * 0.23//100
            z:2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
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
                anchors.verticalCenter: parent.verticalCenter
                width: 60
                height: 60
                anchors.leftMargin: 25//115

                function sliderControl(){
                    //slider_button.anchors.leftMargin = (slider_button.anchors.leftMargin === 25) ? 115 : 25
                    if (slider_button.anchors.leftMargin === 25) {
                        slider_button.anchors.leftMargin = 115;
                        slider_lock.opacity = 0.4
                        slider_unlock.opacity = 0
                        lockStatus = "Unlocked"
                        slider_button.source =  "qrc:/src/images/slider_button_green.png"
                    }
                    else {
                        slider_button.anchors.leftMargin = 25;
                        slider_lock.opacity = 0
                        slider_unlock.opacity = 0.4
                        lockStatus = "Locked"
                        slider_button.source =  "qrc:/src/images/slider_button.png"
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
                anchors.leftMargin: 34
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
                anchors.left: parent.left
                anchors.leftMargin: 120
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
