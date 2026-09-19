import QtQuick
import QtQuick.Layouts


RowLayout {


    spacing:10



    Rectangle {


        id: inputBox


        Layout.fillWidth:true


        height:30



        radius:
            height / 2



        color:
            "#f7f7f7"



        border.width:

            input.activeFocus

            ? 2

            : 1



        border.color:

            input.activeFocus

            ? "#4f8cff"

            : "#dddddd"



        Behavior on border.color {

            ColorAnimation {

                duration:200

            }

        }



        TextInput {


            id:input



            anchors.fill:
                parent



            anchors.leftMargin:
                18



            anchors.rightMargin:
                18



            verticalAlignment:
                TextInput.AlignVCenter



            font.pixelSize:
                16



            clip:
                true



            selectByMouse:
                true



            color:
                "#333333"



            onAccepted:
            {
                addTodo()
            }



            Text {


                anchors.fill:
                    parent



                text:
                    "输入待办事项..."



                verticalAlignment:
                    Text.AlignVCenter



                color:
                    "#999999"



                font:
                    input.font



                visible:
                    input.text.length === 0
                    &&
                    !input.activeFocus


            }

        }

    }




    Rectangle {


        id:addButton



        width:
            90


        height:
            30



        radius:
            height / 2



        color:


            mouseArea.pressed

            ? "#3b6fd8"

            : mouseArea.containsMouse

              ? "#6a9cff"

              : "#4f8cff"



        Behavior on color {

            ColorAnimation {

                duration:150

            }

        }



        scale:

            mouseArea.pressed

            ?0.95

            :1



        Behavior on scale {

            NumberAnimation {

                duration:100

            }

        }




        Text {


            anchors.fill:
                parent



            text:
                "添加"



            color:
                "white"



            font.pixelSize:
                16



            horizontalAlignment:
                Text.AlignHCenter



            verticalAlignment:
                Text.AlignVCenter

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
                addTodo()
            }

        }

    }




    function addTodo()
    {

        let text =
            input.text.trim()



        if(text.length === 0)
            return



        todoManager.addTodo(text)



        input.clear()



        input.forceActiveFocus()

    }

}