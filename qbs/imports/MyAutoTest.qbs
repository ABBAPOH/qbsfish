import qbs.base 1.0

Product {
    Depends { name: "buildconfig" }
    type: ["application", "autotest"]
    destinationDirectory: buildconfig.install_binary_path
    consoleApplication: true

    cpp.rpaths: qbs.targetOS.contains("macos")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib" + mym.lib_suffix + "/" + mym.app_target ]
}
