import QtQuick
import QtQuick.Controls



ListView {

    clip:true
    id:list


    model:
        todoModel


    spacing:8



    delegate:
        TodoItem {}



    add:

    Transition {

        NumberAnimation {

            property:"opacity"

            from:0

            to:1

            duration:250

        }


        NumberAnimation {

            property:"scale"

            from:0.95

            to:1

            duration:250

        }

    }


    remove:

    Transition {


        ParallelAnimation {


            NumberAnimation {

                property:"opacity"

                to:0

                duration:200

            }


            NumberAnimation {

                property:"x"

                to:100

                duration:200

            }

        }

    }

}