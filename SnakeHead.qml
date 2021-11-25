import QtQuick 2.1
import QtTest 1.2

Rectangle{
    id: snakehead;
    width: 50;
    height: 50;
    focus: true;
    x: 100;
    y: 100;
    property var headdirection: SnakeHead.CH.LEFT;
    //枚举类型，定义蛇头的方向
    enum CH {UP,DOWN,LEFT,RIGHT}


    TestCase{
        id: timewait;
        function waitSeveralSeconds(seconds)
        {
            sleep(3000);//毫秒
        }

    }

//    Keys.enabled: true;
//    Keys.onPressed: {
//        switch(event.key)
//        {
//        case Qt.Key_Right:
//            snakehead.x +=10;
//        }
//    }


    //自定义信号
    signal headCreateComplete();

    Canvas{
        id: snakeheadcanva;
        width: 10;
        height: 10;
        anchors.fill: parent
        property string picturepath: "./pic/head_left.jpg";
        onPaint: {
            //timewait.waitSeveralSeconds(10);
            var ctx = getContext("2d");
            ctx.drawImage(picturepath,0,0);
        }
        Component.onCompleted: loadImage(picturepath);
        onImageLoaded: requestPaint();
    }
    Component.onCompleted: headCreateComplete();
}
