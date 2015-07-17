import qbs.base 1.0
import qbs.FileInfo

Application {
    Depends { name: "cpp" }

    destinationDirectory: project.install_app_path

    cpp.cFlags: project.cFlags
    cpp.cxxFlags: project.cxxFlags
    cpp.linkerFlags: project.linkFlags
    cpp.includePaths: project.includePaths
    cpp.libraryPaths: project.libraryPaths
    cpp.cxxLanguageVersion: "c++11"
    cpp.minimumOsxVersion: "10.7"
    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib/" + project.app_target ]

    Group {
        fileTagsFilter: ["application"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? FileInfo.joinPaths(install_app_path, FileInfo.path(bundle.executablePath))
                        : install_app_path
    }
}
