import qbs.base 1.0

FishProduct {
    type: ["application", "autotest"]
    destinationDirectory: project.install_binary_path
    consoleApplication: true

    Depends { name: "cpp" }
    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib" + project.lib_suffix + "/" + project.app_target ]
}
