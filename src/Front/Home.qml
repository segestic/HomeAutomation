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
        id: profile_widget
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
        source: 'qrc:/src/images/bg_glass.png' //background_music //background2

        Timer {
            id: timer
            property var currentDate: new Date()
            property string currentTime: currentDate.getHours() + ":" + currentDate.getMinutes()
            interval: 1000
            repeat: true
            running: true
            onTriggered: timer.currentDate = new Date()
        }

        Text{
            id: welcome_user
            text: "Hi, User"
            color: "#FFFFFF"
            //font: customFont1.font
            font.pointSize: Math.round(parent.width * 0.025)
            anchors{
                top: parent.top
                topMargin: parent.height * 0.06
                left: parent.left
                leftMargin: parent.width * 0.05
            }
        }
        Text{
            id: welcome_description
            property string txt:  "ou are in Olus Home"
            text: "Y"
            color: "#AABCDB"
            //font: customFont1.font
            font.pointSize: Math.round(parent.width * 0.025)
            anchors{
                top: welcome_user.bottom
                topMargin: parent.height * 0.02
                left: parent.left
                leftMargin: parent.width * 0.05
            }
        }
        //typewritin

        Timer {
            id:time_type
            property int currentIndex: 0
            property int speed: 100;
            interval: speed
            repeat: true
            running: true
            onTriggered: {
                if (currentIndex === welcome_description.text.length) {
                    currentIndex= 0;
                    welcome_description.text = "Y";
                    //stop();
                } else {
                    welcome_description.text += welcome_description.txt.charAt(currentIndex);
                    currentIndex++;
                }
            }
        }

        Text{
            id: status_day
            text: "Status of the day"
            color: "#FFFFFF"
            //font: customFont1.font
            font.pointSize: Math.round(parent.width * 0.015)
            anchors{
                top: welcome_description.bottom
                topMargin: parent.height * 0.04
                left: parent.left
                leftMargin: parent.width * 0.05
            }
        }

        HomeTopWidget{
            id: home1

            anchors {
                top: status_day.bottom
                topMargin: parent.height * 0.03
                left: parent.left
                leftMargin: parent.width * 0.045
            }
        }
        Text{
            id: text_controller
            text: "Controllers"
            color: "#FFFFFF"
            //font: customFont1.font
            font.pointSize: Math.round(parent.width * 0.015)
            anchors{
                top: home1.bottom
                topMargin: parent.height * 0.04
                left: parent.left
                leftMargin: parent.width * 0.05
            }
        }
        HomeWidget{
            id: door_widget
            widgetName: "DOORS"
            imageLoc: "qrc:/src/images/home_icons/doors.png"
            nextPage: "qrc:/src/Front/Door.qml"
        }

        HomeWidget{
            id: music_widget
            widgetName: "MUSIC"
            imageLoc: "qrc:/src/images/home_icons/music.png"
            anchors {
                left: door_widget.right
                leftMargin: parent.width * 0.01
            }
        }
        HomeWidget{
            id: lighting_widget
            widgetName: "LIGHTING"
            imageLoc: "qrc:/src/images/home_icons/lightning.png"
            anchors {
                left: music_widget.right
                leftMargin: parent.width * 0.01
            }
        }
        HomeWidget{
            id: tv_widget
            widgetName: "TV"
            imageLoc: "qrc:/src/images/home_icons/tv.png"
            anchors {
                left: lighting_widget.right
                leftMargin: parent.width * 0.01
            }

        }
        HomeWidget{
            id: curtains_widget
            widgetName: "CURTAINS"
            imageLoc: "qrc:/src/images/home_icons/curtains.png"
            anchors {
                left: tv_widget.right
                leftMargin: parent.width * 0.01
            }
        }
        Timer{
            id: simulator
            running: false
            repeat: true
            interval: 150 //console.log('simulator is triggered');
            onTriggered: { }
        }
    }
    //Component.onCompleted: {simulator.start()}
}



