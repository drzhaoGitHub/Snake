import QtQuick
import QtQuick.Window

import QtTest 1.2


Window {
    width: 750
    height: 550
    visible: true
    title: qsTr("snake")



//    TextInput {
//        width: 120
//        height: 30
//        anchors.left: parent.contentItem.left;
//        anchors.top: parent.contentItem.top;
//        anchors.topMargin: 30;
//        font.pixelSize: 30;
//        focus: true;
//    }

    TestCase{
        id: timewait;
        function waitSeveralSeconds(seconds)
        {
            wait(500);//毫秒
        }

    }

    SnakeHead {
        id: head;

        Keys.enabled: true;
        Keys.onPressed: function(event){
            switch(event.key)
            {
            case Qt.Key_Left:
                head.headdirection = SnakeHead.CH.LEFT;
                break;
            case Qt.Key_Right:
                head.headdirection = SnakeHead.CH.RIGHT;
                break;
            case Qt.Key_Up:
                head.headdirection = SnakeHead.CH.UP;
                break;
            case Qt.Key_Down:
                head.headdirection = SnakeHead.CH.DOWN;
                break;            }
        }
    }


//创建定时器 通过定时器实现移动效果
//    Timer{
//            id:countDown;
//            interval: 500;
//            repeat: true;
//            triggeredOnStart: true;

//            onTriggered: {
//               head.y += 5;
//            }
//        }

//    Connections {
//        target: head;
//        function onHeadCreateComplete() {
//            countDown.start();
//        }
//    }

    Connections {
        target: head;
        function onHeadCreateComplete() {
            while(true)
            {
                timewait.waitSeveralSeconds(1000);
                //head.y += 5;
                switch(head.headdirection)
                {
                case SnakeHead.CH.RIGHT:
                    head.x += 10;
                    break;
                case SnakeHead.CH.LEFT:
                    head.x -= 10;
                    break;
                case SnakeHead.CH.UP:
                    head.y -= 10;
                    break;
                case SnakeHead.CH.DOWN:
                    head.y += 10;
                    break;

                }
            }
        }
    }
}
