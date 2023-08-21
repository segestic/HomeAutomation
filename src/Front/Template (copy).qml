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

    Item {
        Image {
            id: arrow_icon
            source: "qrc:/src/images/arrow_icon.png"
            anchors{
                top: parent.top
                topMargin: 90
                left: parent.left
                leftMargin: 9
            }

        }
        Image {
            id: settings_icon
            source: "qrc:/src/images/settings_icon.png"
            anchors{
                top: arrow_icon.bottom
                topMargin: 50
                left: parent.left
                leftMargin: 9
            }

        }
        Image {
            id: music_icon
            source: "qrc:/src/images/music_icon.png"
            anchors{
                top: settings_icon.bottom
                topMargin: 50
                left: parent.left
                leftMargin: 9
            }
            MouseArea {
                anchors.fill: music_icon
                onClicked: {
                    console.log("Music icon clicked")
                    pageLoader.source = "qrc:/src/Front/Components/Music.qml"

                }
            }
        }
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
        source: 'qrc:/src/images/background.png'
        //fillMode: Image.Stretch

    }
}


//APIs gotten frm
//https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-rectangularglow.html







