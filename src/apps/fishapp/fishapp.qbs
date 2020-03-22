import qbs.FileInfo

MyApp {
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "FishLib" }

    name: "Fish"

    files: [ "*.cpp", "*.h", "*.ui" ]

//    bundle.infoPlistFile: "Info.plist.in"

    Group {
        name: "Fish.icns"
        condition: qbs.targetOS.contains("macos")
        files: [ "Fish.icns" ]
        qbs.install: true
        qbs.installDir: buildconfig.installDataPath
    }

    Group {
        name: "fish.png"
        condition: qbs.targetOS.contains("linux")
        files: [ "fish.png" ]
        qbs.install: true
        qbs.installDir: "share/pixmaps"
    }

    Group {
        name: "fish.desktop"
        condition: qbs.targetOS.contains("unix") && !qbs.targetOS.contains("macos")
        files: [ "fish.desktop" ]
        qbs.install: true
        qbs.installDir: "share/applications"
    }
}
