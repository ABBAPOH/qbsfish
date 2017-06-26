import qbs.base 1.0
import qbs.FileInfo

MyApp {
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "FishLib" }

    name: "Fish"

    files: [ "*.cpp", "*.h", "*.ui" ]

//    bundle.infoPlistFile: "Info.plist.in"

    Group {
        fileTagsFilter: bundle.isBundle ? ["bundle.content"] : ["application"]
        qbs.install: true
        qbs.installDir: mym.install_app_path
        qbs.installSourceBase: project.buildDirectory + '/' + product.destinationDirectory
    }

    Group {
        name: "Fish.icns"
        condition: qbs.targetOS.contains("osx")
        files: [ "Fish.icns" ]
        qbs.install: true
        qbs.installDir: mym.install_data_path
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
        condition: qbs.targetOS.contains("unix") && !qbs.targetOS.contains("osx")
        files: [ "fish.desktop" ]
        qbs.install: true
        qbs.installDir: "share/applications"
    }
}
