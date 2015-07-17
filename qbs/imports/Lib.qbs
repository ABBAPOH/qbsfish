import qbs.base 1.0

DynamicLibrary {
    Depends { name: "cpp" }

    destinationDirectory: project.install_library_path

    bundle.isBundle: false
    cpp.cFlags: project.cFlags
    cpp.cxxFlags: project.cxxFlags
    cpp.linkerFlags: project.linkFlags
    cpp.includePaths: project.includePaths
    cpp.libraryPaths: project.libraryPaths
    cpp.cxxLanguageVersion: "c++11"
    cpp.minimumOsxVersion: "10.7"
    cpp.installNamePrefix: "@rpath/Frameworks"
    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@loader_path/..", "@executable_path/.." ]
                : [ "$ORIGIN" ]

    Group {
        fileTagsFilter: product.type
        qbs.install: true
        qbs.installDir: project.install_library_path
    }
}
