import QtQuick


Rectangle {


    id:root



    width:
        parent.width



    height:
        30



    radius:
        height / 2



    property bool hovered:
        mouseArea.containsMouse





    color:

        mouseArea.pressed

        ? "#ffd0d0"

        :

        hovered

        ? "#ffe5e5"

        : "#f2f2f2"





    border.width:
        1



    border.color:

        hovered

        ? "#ffcccc"

        : "#e5e5e5"





    scale:

        mouseArea.pressed

        ? 0.97

        : 1





    Behavior on color {

        ColorAnimation {

            duration:150

        }

    }




    Behavior on border.color {

        ColorAnimation {

            duration:150

        }

    }




    Behavior on scale {

        NumberAnimation {

            duration:100

            easing.type:
                Easing.OutCubic

        }

    }





    Text {


        anchors.fill:
            parent



        text:
            "清空已完成事项"



        color:

            hovered

            ? "#e74c3c"

            : "#888888"





        font.pixelSize:
            15





        horizontalAlignment:
            Text.AlignLeft



        verticalAlignment:
            Text.AlignVCenter



        leftPadding:
            15



        Behavior on color {

            ColorAnimation {

                duration:150

            }

        }

    }





    MouseArea {


        id:mouseArea



        anchors.fill:
            parent




        hoverEnabled:
            true




        cursorShape:
            Qt.PointingHandCursor




        onClicked:
        {
            todoManager.clearCompleted()
        }

    }

}