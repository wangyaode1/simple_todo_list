import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Label {

    id:titleLabel


    text:
        "待办事项清单"



    font.pixelSize:
        30



    font.family:
        "SimSun"



    Layout.alignment:
        Qt.AlignLeft



    Layout.leftMargin:
        0



    opacity:
        0



    Component.onCompleted:
    {
        Qt.callLater(function(){
            appear.start()
        })
    }



    NumberAnimation {

        id:appear


        target:
            titleLabel


        property:
            "opacity"


        from:
            0


        to:
            1


        duration:
            1500


        easing.type:
            Easing.OutCubic

    }

}