import QtQuick 2.1

Rectangle{
    id: snakehead;
    width: 50;
    height: 50;
    Canvas{
        id: snakeheadcanva;
        width: 10;
        height: 10;
        anchors.fill: parent
        property string picturepath: "./pic/head_left.jpg";
        onPaint: {
            var ctx = getContext("2d");
            ctx.drawImage(picturepath,0,0);
        }
        Component.onCompleted: loadImage(picturepath);
        onImageLoaded: requestPaint();
    }
}
