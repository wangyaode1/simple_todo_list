import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {


    id:item



    width:
        ListView.view.width



    height:
        55



    radius:
        14



    color:

        mouseArea.containsMouse

        ? "#fafafa"

        :

        model.completed

        ? "#eeeeee"

        : "white"



    border.width:
        1



    border.color:
        "#dddddd"



    Behavior on color {

        ColorAnimation {

            duration:150

        }

    }



    MouseArea {

        id:mouseArea

        anchors.fill:
            parent


        hoverEnabled:
            true


        propagateComposedEvents:
            true

    }





    RowLayout {


        anchors.fill:
            parent



        anchors.leftMargin:
            12



        anchors.rightMargin:
            12



        spacing:
            12





        // 自定义CheckBox

        Rectangle {


            id:checkBox



            width:
                22



            height:
                22



            radius:
                6



            color:

                model.completed

                ? "#4f8cff"

                : "transparent"



            border.width:
                model.completed ? 0 : 2



            border.color:
                "#bbbbbb"



            Behavior on color {

                ColorAnimation {

                    duration:150

                }

            }



            Text {


                anchors.centerIn:
                    parent



                text:
                    "✓"



                visible:
                    model.completed



                color:
                    "white"



                font.pixelSize:
                    16


            }



            MouseArea {


                anchors.fill:
                    parent



                cursorShape:
                    Qt.PointingHandCursor



                onClicked:
                {
                    todoManager.toggleTodo(index)
                }

            }

        }





        Label {


            text:
                model.title



            Layout.fillWidth:
                true



            font.pixelSize:
                16



            color:
                "#333333"



            opacity:

                model.completed

                ?0.45

                :1



            Behavior on opacity {

                NumberAnimation {

                    duration:200

                }

            }



        }





        // 删除按钮

        Rectangle {


            id:deleteButton



            width:
                55



            height:
                32



            radius:
                16



            color:


                deleteMouse.pressed

                ? "#ffd6d6"

                :

                deleteMouse.containsMouse

                ? "#ffe8e8"

                : "transparent"



            Behavior on color {

                ColorAnimation {

                    duration:150

                }

            }




            Text {


                anchors.fill:
                    parent



                text:
                    "删除"



                color:
                    "#e74c3c"



                font.pixelSize:
                    14



                horizontalAlignment:
                    Text.AlignHCenter



                verticalAlignment:
                    Text.AlignVCenter

            }




            MouseArea {


                id:deleteMouse



                anchors.fill:
                    parent



                hoverEnabled:
                    true



                cursorShape:
                    Qt.PointingHandCursor



                onClicked:
                {
                    todoManager.removeTodo(index)
                }

            }

        }

    }

}