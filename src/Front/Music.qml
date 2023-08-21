//GLOW
import QtQuick
import Qt5Compat.GraphicalEffects
import "./Components"

Rectangle {
    id: music_home

    property int sliderValue : -20 // -20 to 450

    function incrementSlider() {
        let value = music_home.sliderValue;
        const step = 25; // Increment
        value += step; // Increment the value by the step
        if (value > 450) {
            value = -20; // Reset the value to -20 if it exceeds 450
        }
        music_home.sliderValue = value; // Update the slider value
        return value;
    }

    width: Window.width
    height: Window.height
    color: "black"
    radius: 40

    SideBar{
        id: side
    }
    ProfileWidget{
        z:20
    }

    FontLoader {
        id: customFont1
        source: "qrc:/content/fonts/Lobster-Regular.ttf"
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
        source: 'qrc:/src/images/background_music.png'
        //fillMode: Image.Stretch
    }

    Image{
        id: music_pic
        width: parent.width * 0.4
        height: parent.height * 0.4
        x: 50
        z:1
        source: "qrc:/src/images/music/music_pic.png"
        anchors{
            top: parent.top
            topMargin: Window.height * 0.12
            horizontalCenter: background.horizontalCenter
        }
    }

    Image{
        id: rectange_opacity
        width: parent.width * 0.8
        height: parent.height * 0.1
        source: "qrc:/src/images/music/Rectangle_opacitymusic_rect.png"

        anchors{
            top: music_pic.bottom
            topMargin: 0
            horizontalCenter: background.horizontalCenter

        }
        Text{
            id: music_album
            text: "<b>" + "Music Album Song" + "</b>"
            color: "#FFFFFF"
            font: customFont1.font
            anchors{
                top: parent.top
                topMargin: 4
                horizontalCenter: parent.horizontalCenter
            }
        }
        Text{
            id: music_title
            text: "Music Text"
            color: "#AABCDB"
            //font: customFont1.font
            font.pointSize: 8
            anchors{
                top: music_album.bottom
                topMargin: 4
                horizontalCenter: parent.horizontalCenter
            }
        }
    }
    Item{
        id: container
        width: parent.width * 0.8
        height: parent.height * 0.4
        anchors.top: rectange_opacity.bottom

        anchors.horizontalCenter: rectange_opacity.horizontalCenter


        Image{
            id: main_line
            width: parent.width * 0.8
            source: "qrc:/src/images/music/music_line1.png"
            anchors{
                top: parent.top
                topMargin: parent.height * 0.1
                horizontalCenter: parent.horizontalCenter
            }
            Image{
                id: slider
                //width: parent.width * 0.8
                source: "qrc:/src/images/music/music_knob.png"
                anchors{
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 5
                    left: parent.left
                    leftMargin: music_home.sliderValue //increase or decrease value range of -20 to 450
                }
            }
        }
        Text{
            id: duration_start
            color: "white"
            text: "0:00"
            anchors{
                top: parent.top
                topMargin: parent.height * 0.21
                left: parent.left
                leftMargin: Window.width * 0.09
            }
        }
        Text{
            id: duration_end
            color: "white"
            text: "5:21"
            anchors{
                top: parent.top
                topMargin: parent.height * 0.21
                right: parent.right
                rightMargin: Window.width * 0.09
            }
        }
        Rectangle{
            id: play_status
            color: "#24272C"
            width: 90
            height: 50
            radius: width * 0.25
            z:5
            anchors{
                top: parent.top
                topMargin: parent.height * 0.3
                horizontalCenter: parent.horizontalCenter
                //verticalCenter: parent.verticalCenter
            }
            Image{
                id:play_pause
                source: "qrc:/src/images/music/music_play_pause.png"
                anchors{
                    centerIn: parent
                }
            }
        }
        Image{
            id: previous
            source: "qrc:/src/images/music/music_prev.png"
            anchors{
                top: parent.top
                topMargin: parent.height * 0.35
                horizontalCenter: parent.horizontalCenter
                horizontalCenterOffset: -100
            }
        }
        Image{
            id: next
            source: "qrc:/src/images/music/music_next.png"
            anchors{
                top: parent.top
                topMargin: parent.height * 0.35
                horizontalCenter: parent.horizontalCenter
                horizontalCenterOffset: 100

            }
            MouseArea {
                width: parent.width
                height: parent.height
                onClicked: {
                    incrementSlider()
                    //console.log('right slider clicked...')
                    //slider_button.anchors.leftMargin = (slider_button.anchors.leftMargin === 25) ? 115 : 25
                }
            }
        }
    }
}




