import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


ApplicationWindow {

    visible: true

    width: 500
    height: 700

    title: "Todo List"

    // 一列一列的视图，主视图
    ColumnLayout {

        anchors.fill: parent
        anchors.margins: 20

        spacing: 15

        // Header 结构
        TodoHeader {}

        // 插入条目的输入框
        TodoInput {

            Layout.fillWidth: true

        }


        // 核心列表，属于是核心视图
        TodoList {

            Layout.fillWidth: true
            Layout.fillHeight: true

        }


        // Footer 结构
        TodoFooter {

            Layout.fillWidth: true

        }
    }
}