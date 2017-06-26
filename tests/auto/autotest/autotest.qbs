import qbs.base 1.0

FishAutoTest {
    name: "AutoTest"
    Depends { name: "Lib" }
    Depends { name: "Qt.core" }
    files: [ "*.cpp", "*.h" ]
}
