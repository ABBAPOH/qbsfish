import qbs.FileInfo

MyApp {
    Depends { name: "buildconfig" }
    Depends { name: "ib" }
    Depends { name: "freedesktop" }
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "FishLib" }
    Depends { name: "FishPlugin"; cpp.link: false }

    name: "Fish"
    targetName: buildconfig.appTarget
    ib.appIconName: "Fish"

    files: [
        "Fish-Info.plist",
        "fish.desktop",
        "fish.rc",
        "fish.xcassets",
        "main.cpp",
        "mainwindow.cpp",
        "mainwindow.h",
        "mainwindow.ui",
    ]

    Group {
        name: "fish.png"
        condition: qbs.targetOS.contains("linux")
        files: [ "fish.png" ]
        qbs.install: true
        qbs.installDir: "share/pixmaps"
    }
}
