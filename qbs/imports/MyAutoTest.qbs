import qbs.base 1.0

MyProduct {
    type: ["application", "autotest"]
    destinationDirectory: buildconfig.install_binary_path
    consoleApplication: true

    Depends { name: "cpp" }
    cpp.rpaths: qbs.targetOS.contains("macos")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib" + mym.lib_suffix + "/" + mym.app_target ]
}
