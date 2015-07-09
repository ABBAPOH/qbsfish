import qbs.base 1.0

AutoTest {
    name: "AutoTest"
    Depends { name: "Lib" }
    files: [ "*.cpp", "*.h" ]
}
