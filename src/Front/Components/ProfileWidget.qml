//GLOW
import QtQuick
import Qt5Compat.GraphicalEffects


Item{
    id: widget
    property int battPercentage: 70
    width: Window.width * 0.4
    height: Window.height * 0.1
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: Window.height * 0.03

    Image{
        id: profile_pic
        source: "qrc:/src/images/home_icons/profile_pic.png"
        width: parent.width * 0.11
        height: parent.height * 0.75
        anchors {
            top: parent.top
            topMargin: - Window.width * 0.004
            left: parent.left
            leftMargin: Window.width * 0.04
        }
    }
    Rectangle{
        id: rect
        width: widget.width * 0.5
        height: parent.height * 0.6
        radius: width * 0.08
        border.color: "#24272C"
        //z: 4
        color: "#000000"//24272C
        anchors.left: profile_pic.right
        anchors.leftMargin: Window.width * 0.01

        Image{
            id: search_icon
            source: "qrc:/src/images/home_icons/Searchsearch.png"
            width: parent.width * 0.07
            height: parent.height * 0.07
            anchors {
                top: parent.top
                topMargin: parent.height * 0.015
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: parent.width * 0.06

            }
        }
        Text{
            id: search_text
            text: "Search"
            color: "#242700"
            anchors{
                left: search_icon.left
                leftMargin: parent.width * 0.1
                verticalCenter: parent.verticalCenter
            }
        }
        Image{
            id: battery
            source: "qrc:/src/images/home_icons/battery.png"
            width: parent.width * 0.05 //10
            height: parent.height * 0.6 //25
            anchors {
                top: parent.top
                topMargin: parent.height * 0.15
                left: rect.right
                leftMargin: 10
            }
        }
        Text{
            id: battery_text
            text: battPercentage + "%"
            color: "#ffffff"
            //font: customFont1.font
            font.pointSize: Math.round(parent.width * 0.07)
            anchors{
                verticalCenter: parent.verticalCenter
                left: battery.right
                leftMargin: 5
            }
        }
    }
}
