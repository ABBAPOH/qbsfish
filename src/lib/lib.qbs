import qbs.base 1.0

MyLibrary {
    Depends { name: "Qt.core" }

    name: "FishLib"
    files: [ "*.cpp", "*.h" ]
    cpp.defines: ["FISHLIB_LIBRARY"]
}
