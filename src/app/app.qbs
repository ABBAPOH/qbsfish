import qbs.base 1.0

App {
    name: project.app_target
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    files: [ "*.cpp", "*.h" ]
}
