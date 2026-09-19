cmake_minimum_required(VERSION 3.16)

project(SimpleTodolist VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appSimpleTodolist
    main.cpp
)

qt_add_qml_module(appSimpleTodolist
    URI SimpleTodolist
    QML_FILES
        Main.qml
        QML_FILES
        SOURCES
        SOURCES TodoItem.h
        SOURCES TodoModel.h
        SOURCES TodoModel.cpp
        SOURCES TodoManager.cpp
        SOURCES TodoManager.h
        QML_FILES todo.json
        QML_FILES TodoHeader.qml
        QML_FILES TodoInput.qml
        QML_FILES TodoList.qml
        QML_FILES TodoItem.qml
        QML_FILES TodoFooter.qml
        RESOURCES ../Pictures/Avatar/CatProfile.jpg
        RESOURCES ../Pictures/Avatar/CatProfile.jpg
        RESOURCES
        RESOURCES icon.qrc
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSimpleTodolist PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSimpleTodolist
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSimpleTodolist
    PRIVATE Qt6::Quick
)

install(TARGETS appSimpleTodolist
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
