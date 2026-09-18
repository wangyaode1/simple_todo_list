# TodoList 项目技术栈

## 1. Qt 6

项目使用 Qt 6 作为主要开发框架，用于构建整个 TodoList 应用程序。

Qt 主要负责：

* 应用程序运行环境
* QML 界面
* C++ 与 QML 的通信
* 数据模型
* JSON 数据处理

## 2. C++17

项目后端使用 C++17 开发，主要负责 Todo 数据管理和业务逻辑。

主要功能包括：

* Todo 数据结构
* Todo 列表管理
* 添加、删除和修改 Todo
* JSON 数据的读取与保存

## 3. QML

项目使用 QML 开发用户界面。

QML 主要负责：

* Todo 输入框
* 按钮
* Todo 列表
* 完成状态显示
* 用户交互
* 界面布局

通过 C++ 暴露的接口，QML 可以调用后端的 Todo 操作。

## 4. QAbstractListModel

项目使用 Qt 的 `QAbstractListModel` 管理 Todo 列表数据。

`TodoModel` 继承自 `QAbstractListModel`，负责将 C++ 中的 Todo 数据提供给 QML 的 `ListView` 使用。

Todo 的主要数据包括：

* `title`：Todo 内容
* `completed`：是否完成

## 5. JSON

项目使用 JSON 文件保存 Todo 数据，实现本地数据持久化。

程序启动时读取 `todo.json`，程序运行过程中修改 Todo 后自动保存数据，使应用程序重新启动后仍能保留之前的 Todo。

## 6. CMake

项目使用 CMake 管理项目构建。

CMake 负责：

* 配置 C++17 编译环境
* 查找 Qt 6
* 编译 C++ 源文件
* 管理 QML 文件
* 链接 Qt 模块

## 7. 技术栈总结

```text
Qt 6
├── C++17
│   ├── TodoItem
│   ├── TodoModel
│   └── TodoManager
│
├── QML / Qt Quick
│   └── Main.qml
│
├── QAbstractListModel
│   └── C++ ↔ QML 数据交互
│
├── JSON
│   └── Todo 数据持久化
│
└── CMake
    └── 项目构建管理
```
