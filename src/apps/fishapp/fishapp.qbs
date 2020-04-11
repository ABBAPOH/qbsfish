import qbs.FileInfo

MyApp {
    Depends { name: "buildconfig" }
    Depends { name: "freedesktop" }
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "FishLib" }
    Depends { name: "FishPlugin"; cpp.link: false }

    name: "Fish"
    targetName: buildconfig.appTarget

    files: [ "*.cpp", "*.h", "*.ui", "*Info.plist", "*.desktop" ]

    Group {
        name: "Fish.icns"
        condition: qbs.targetOS.contains("macos")
        files: [ "Fish.icns" ]
        qbs.install: true
        qbs.installDir: buildconfig.installDataPath
    }

    Group {
        name: "fish.rc"
        condition: qbs.targetOS.contains("windows")
        files: [ "fish.rc" ]
    }

    Group {
        name: "fish.png"
        condition: qbs.targetOS.contains("linux")
        files: [ "fish.png" ]
        qbs.install: true
        qbs.installDir: "share/pixmaps"
    }
}
