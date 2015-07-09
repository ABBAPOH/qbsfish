import qbs.base 1.0
import qbs.FileInfo

App {
    name: project.app_target
    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "Lib" }
    files: [ "*.cpp", "*.h" ]

    bundle.infoPlistFile: "Info.plist.in"

    Group {
        name: ".icns"
        condition: qbs.targetOS.contains("osx")
        files: "Fish.icns"
        qbs.install: true
        qbs.installDir: install_data_path
    }

    Group {
        fileTagsFilter: ["infoplist"]
        qbs.install: true && bundle.isBundle && !bundle.embedInfoPlist
        qbs.installDir: FileInfo.joinPaths(install_app_path, FileInfo.path(bundle.infoPlistPath))
    }
}
