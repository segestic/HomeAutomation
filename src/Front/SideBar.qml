import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    Image {
        id: home_icon
        source: "qrc:/src/images/home_icon.png"
        anchors{
            top: parent.top
            topMargin: Window.height * 0.15
            left: parent.left
            leftMargin: 9
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                pageLoader.source = "qrc:/src/Front/Home.qml"
                console.log("home icon clicked" )
                //home1.changeImage()
                effect1.state = "home_clicked";
            }
        }
    }
    Image{
        id: effect1
        //visible: false
        source: "qrc:/src/images/active_m.png"
        z:40
        width: 80//parent.width * 0.85
        height: 80//parent.height * 0.75
        opacity: 1
        y: home_icon.y -20

        Behavior on y {
            NumberAnimation {
                duration: 400 // Animation duration in milliseconds
            }
        }

    }
    Image {
        id: door_icon
        source: "qrc:/src/images/door_icon.png"
        anchors{
            top: home_icon.bottom
            topMargin: Window.height * 0.09
            left: parent.left
            leftMargin: 9
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                effect1.state = "door_clicked";
                if (effect1.state === "door_clicked"){
                    pageLoader.source = "qrc:/src/Front/Door.qml"}
                console.log("door icon clicked")
            }
        }

    }
    Image {
        id: music_icon
        source: "qrc:/src/images/music_icon.png"
        anchors{
            top: door_icon.bottom
            topMargin: Window.height * 0.09
            left: parent.left
            leftMargin: 9
        }
        MouseArea {
            anchors.fill: music_icon
            onClicked: {
                //home_icon.move = music_icon.y - 20
                effect1.state = "music_clicked";
                if (effect1.state === "music_clicked"){
                    pageLoader.source = "qrc:/src/Front/Music.qml"}
                console.log("Music icon clicked")

            }
            onEntered: {
                //effect1.state = "home_clicked";
                console.log('music icon hovered');
            }
        }
    }
    states: [
        // State: highlighted
        State {
            name: "home_clicked"
            // Set properties for the highlighted state
            PropertyChanges {
                target: effect1
                y: home_icon.y - 20
                scale: 1.8
            }
        },
        State {
            name: "door_clicked"

            // Set properties for the highlighted state
            PropertyChanges {
                target: effect1
                y: door_icon.y - 20
                scale: 1.8
            }
        },
        State {
            name: "music_clicked"

            // Set properties for the highlighted state
            PropertyChanges {
                target: effect1
                y: music_icon.y - 20
                scale: 1.8
            }
        }
    ]
    transitions: [
        // Transition for smooth property changes
        Transition {
            from: "*"
            to: "*"
            NumberAnimation {
                duration: 400 // Animation duration in milliseconds
            }
        }
    ]

}


//APIs gotten frm
//https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-rectangularglow.html
