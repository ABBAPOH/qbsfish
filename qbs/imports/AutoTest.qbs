import qbs.base 1.0

Product {
    Depends { name: "cpp" }

    type: ["application", "autotest"]

    destinationDirectory: project.install_binary_path

    consoleApplication: true

    cpp.includePaths: base.concat(project.includePaths)
    cpp.libraryPaths: base.concat(project.libraryPaths)
    cpp.cxxFlags: base.concat(project.cxxFlags)
    cpp.linkerFlags: base.concat(project.linkFlags)
    cpp.cxxLanguageVersion: "c++11"

    Properties {
        condition: qbs.targetOS.contains("osx")
        cpp.minimumOsxVersion: "10.7"
    }

    Properties {
         condition: qbs.targetOS.contains("linux") || qbs.targetOS.contains("unix")
         cpp.rpaths: [ "$ORIGIN/../lib" + project.lib_suffix + "/" + project.app_target ]
    }
}
