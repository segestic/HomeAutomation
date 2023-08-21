//GLOW
import QtQuick
import Qt5Compat.GraphicalEffects


Rectangle{
    id: widget
    property string widgetName: "DOORS"
    property string imageLoc: "qrc:/src/images/slider_lock.png"
    property string nextPage: "qrc:/src/Front/Music.qml"

    width: Window.width * 0.14
    height: Window.height * 0.27
    color: "#1D2837"
    radius: width * 0.05
    border.color: "#40464F" //40464F //9AA8BC
    border.width: 1
    anchors {
        top: text_controller.bottom
        topMargin: parent.height * 0.03
        left: parent.left
        leftMargin: parent.width * 0.045
    }
    Image{
        id: icon_pic
        source: imageLoc
        width: parent.width * 0.45
        height: parent.height * 0.4
        anchors {
            top: parent.top
            topMargin: parent.height * 0.15
            horizontalCenter: parent.horizontalCenter
        }
    }
    Image{
        id: effect
        source: "qrc:/src/images/yellow_effect.png"
        width: parent.width * 0.85
        height: parent.height * 0.75
        opacity: 0.5
        anchors {
            top: parent.top
            topMargin: parent.height * 0.15
            horizontalCenter: parent.horizontalCenter
        }
    }
    Text{
        id: widget_text
        text: "<b>" + widgetName + "</b>"
        color: "#ffffff"
        //font: customFont1.font
        font.pointSize: Math.round(parent.width * 0.08)
        anchors{
            top: icon_pic.bottom
            topMargin: parent.height * 0.08
            horizontalCenter: parent.horizontalCenter
        }
    }
    PropertyAnimation {
        id: zoomAnimation
        target: widget
        property: "scale"
        to: 1.2
        duration: 200
    }
    PropertyAnimation {
        id: zoomAnimationEnd
        target: widget
        property: "scale"
        to: 1.0
        duration: 200
    }
    MouseArea {
        id:mouseArea
        width: parent.width
        height: parent.height
        hoverEnabled: true

        onEntered: {
            //console.log("Mouse entered")
            zoomAnimation.start()
            // Perform actions when the mouse enters the area
        }

        onExited: {
            //console.log("Mouse exited")
            zoomAnimationEnd.start()
            // Perform actions when the mouse exits the area
        }

        onClicked: {
            pageLoader.source = nextPage
            console.log ('Widget clicked....')
            //slider_button.anchors.leftMargin = (slider_button.anchors.leftMargin === 25) ? 115 : 25
        }
    }
}
