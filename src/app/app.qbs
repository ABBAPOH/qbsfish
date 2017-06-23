import qbs.base 1.0
import qbs.FileInfo

FishProduct {
    type: "application"
    name: project.app_target
    destinationDirectory: project.install_app_path

    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib/" + project.app_target ]

    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "Lib" }

    files: [ "*.cpp", "*.h", "*.ui" ]

//    bundle.infoPlistFile: "Info.plist.in"

    Group {
        fileTagsFilter: ["application"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? FileInfo.joinPaths(install_app_path, FileInfo.path(bundle.executablePath))
                        : project.install_app_path
    }

    Group {
        name: ".icns"
        condition: qbs.targetOS.contains("osx")
        files: [ "Fish.icns", ]
        qbs.install: true
        qbs.installDir: project.install_data_path
    }

    Group {
        fileTagsFilter: ["infoplist"]
        qbs.install: true && bundle.isBundle && !bundle.embedInfoPlist
        qbs.installDir: FileInfo.joinPaths(project.install_app_path, FileInfo.path(bundle.infoPlistPath))
    }
}
