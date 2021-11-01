import QtQuick
import QtQuick.Window

Window {
    width: 750
    height: 550
    visible: true
    title: qsTr("snake")

    SnakeHead {
        id: head;
    }
}
