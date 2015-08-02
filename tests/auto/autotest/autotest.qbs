import qbs.base 1.0

FishAutoTest {
    name: "AutoTest"
    Depends { name: "Lib" }
    files: [ "*.cpp", "*.h" ]
}
