//GLOW
import QtQuick
import Qt5Compat.GraphicalEffects


Rectangle{
    id: weather_container
    property int currentTemp: 27

    width: home.width * 0.5
    height: home.height * 0.2
    color: "#1D2837"
    radius: width * 0.05
    border.color: "#40464F" //40464F //9AA8BC
    border.width: 1
    anchors {
        top: parent.bottom
        topMargin: parent.height * 0.03
        left: parent.left
        leftMargin: parent.width * 0.045
    }
    Image{
        id: effect
        source: "qrc:/src/images/yellow_effect.png"
        width: parent.width * 0.8
        height: parent.height * 1
        opacity: 0.5
        anchors {
            top: parent.top
            topMargin: parent.height * 0.04
            horizontalCenter: parent.horizontalCenter
        }
    }
    Text{
        id: degree_text
        text: currentTemp + qsTr("\xB0") //("\u2103")
        font.pointSize: Math.round(parent.width * 0.09)
        color: "#9AA8BC"
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: parent.width * 0.04
        }
    }
    Text{
        id: cloud_status
        text: "Partly Cloudy"
        font.pointSize: Math.round(parent.width * 0.025)
        color: "#ffffff"
        anchors {
            verticalCenter: parent.verticalCenter
            verticalCenterOffset: parent.height * 0.08
            left: degree_text.right
            leftMargin: parent.width * 0.02
        }
    }
    Image{
        id: cloud_img
        width: parent.width * 0.15
        height: parent.width * 0.15
        source: "qrc:/src/images/weather/pcloudy.png" //pcloudy
        anchors {
            top: weather_container.top
            topMargin: parent.height * 0.11
            left: parent.left
            leftMargin: parent.width * 0.45
        }
    }
    SequentialAnimation {
        id:cloudAnim
        running: true
        loops: Animation.Infinite

        PropertyAnimation {
            target: cloud_img
            property: "scale"
            to: 1.2
            duration: 500
        }
        PropertyAnimation {
            target: cloud_img
            property: "scale"
            to: 1.0
            duration: 500
        }
    }
    Text{
        id: time_text
        text: timer.currentDate.toLocaleTimeString([], { hour: 'numeric', minute: 'numeric', hour12: true })
        //text: timer.currentDate.toLocaleString([], { hour: 'numeric', minute: 'numeric', hour12: true })
        //text: timer.currentDate.toLocaleDateString() //Date in Local Date String
        font.pointSize: Math.round(parent.width * 0.04)
        color: "#ffffff"
        anchors {
            top: parent.top
            topMargin: parent.height * 0.15
            right: parent.right
            rightMargin: parent.width * 0.05
        }
    }
    Text{
        id: location_text
        text: "Virginia"
        font.pointSize: Math.round(parent.width * 0.03)
        color: "#9AA8BC"
        anchors {
            top: parent.top
            topMargin: parent.height * 0.6
            right: parent.right
            rightMargin: parent.width * 0.05
        }
    }

    property int valueInc: 0
    ListModel {
        id: imageListModel

        ListElement {
            source: "qrc:/src/images/weather/pcloudy.png"
            name: "Cloudy"
            temp: 27
        }

        ListElement {
            source: "qrc:/src/images/weather/sunny_color.png"
            name: "Sunny"
            temp: 35
        }

        ListElement {
            source: "qrc:/src/images/weather/thunder_storm.png"
            name: "Thunder Storm"
            temp: 25
        }

        ListElement {
            source: "qrc:/src/images/weather/hail_colorhail.png"
            name: "Hail"
            temp: 15
        }
    }
    function changeImage() {
        if (valueInc < imageListModel.count) {
            cloud_img.source = imageListModel.get(valueInc).source
            cloud_status.text = imageListModel.get(valueInc).name
            currentTemp = imageListModel.get(valueInc).temp
            valueInc++
        } else {
            valueInc = 0
            cloud_img.source = imageListModel.get(valueInc).source
            cloud_status.text = imageListModel.get(valueInc).name
            currentTemp = imageListModel.get(valueInc).temp
        }
    }
}
