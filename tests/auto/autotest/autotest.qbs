import qbs.base 1.0

MyAutoTest {
    name: "AutoTest"
    Depends { name: "FishLib" }
    Depends { name: "Qt.core" }
    files: [ "*.cpp", "*.h" ]
}
