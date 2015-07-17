import qbs.base 1.0

Product {
    Depends { name: "cpp" }

    type: ["application", "autotest"]

    destinationDirectory: project.install_binary_path

    consoleApplication: true

    cpp.cFlags: project.cFlags
    cpp.cxxFlags: project.cxxFlags
    cpp.linkerFlags: project.linkFlags
    cpp.includePaths: project.includePaths
    cpp.libraryPaths: project.libraryPaths
    cpp.cxxLanguageVersion: "c++11"
    cpp.minimumOsxVersion: "10.7"
    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib" + project.lib_suffix + "/" + project.app_target ]
}
