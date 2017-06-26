import qbs.base 1.0
import qbs.FileInfo

FishProduct {
    Depends { name: "cpp" }
    Depends { name: "bundle" }

    type: "application"
    destinationDirectory: mym.install_app_path

    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib/" + mym.app_target ]
}
