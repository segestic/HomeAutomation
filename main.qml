import QtQuick

Window {
    width: 800//640
    height: 480
    visible: true
    title: qsTr("Home Automation")


    Loader { id: pageLoader }

    Component.onCompleted: {pageLoader.source = "qrc:/src/Front/Home.qml"}//MainArcDemo1 //Waterfill2

}
