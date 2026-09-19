#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "TodoModel.h"
#include "TodoManager.h"
#include <QIcon>
#include <QFile>
#include <QDirIterator>
#include <QDebug>


int main(int argc, char *argv[])
{


    QGuiApplication app(argc, argv);

    app.setWindowIcon(
        QIcon(":/qt/qml/SimpleTodolist/Pictures/Avatar/CatProfile.jpg")
        );

    QQmlApplicationEngine engine;

    TodoModel todoModel;

    TodoManager todoManager(&todoModel);

    // 将todoModael注册到 qml环境中去
    engine.rootContext()->setContextProperty(
        "todoModel",
        &todoModel
        );

    // 将todoManager注册到qml中
    engine.rootContext()->setContextProperty(
        "todoManager",
        &todoManager
        );

    todoManager.load();

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []()
        {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection
        );

    engine.loadFromModule(
        "SimpleTodolist",
        "Main"
        );

    return app.exec();
}