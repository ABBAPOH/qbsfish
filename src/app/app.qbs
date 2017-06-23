import qbs.base 1.0
import qbs.FileInfo

FishApp {
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "Lib" }

    files: [ "*.cpp", "*.h", "*.ui" ]

//    bundle.infoPlistFile: "Info.plist.in"

    Group {
        fileTagsFilter: ["application"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? FileInfo.joinPaths(project.install_app_path, FileInfo.path(bundle.executablePath))
                        : project.install_app_path
    }

    Group {
        fileTagsFilter: ["infoplist"]
        qbs.install: true && bundle.isBundle && !bundle.embedInfoPlist
        qbs.installDir: FileInfo.joinPaths(project.install_app_path, FileInfo.path(bundle.infoPlistPath))
    }

    Group {
        name: "Fish.icns"
        condition: qbs.targetOS.contains("osx")
        files: [ "Fish.icns" ]
        qbs.install: true
        qbs.installDir: project.install_data_path
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
