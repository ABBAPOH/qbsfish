import qbs.base 1.0
import qbs.FileInfo

Product {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    type: "application"
    destinationDirectory: buildconfig.install_app_path

    cpp.rpaths: qbs.targetOS.contains("macos")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib/" + buildconfig.app_target ]
}
