import qbs.base 1.0

Product {
    Depends { name: "cpp" }
    Depends { name: "buildconfig" }

    cpp.cxxFlags: buildconfig.cxxFlags
    cpp.linkerFlags: buildconfig.linkFlags
    cpp.includePaths: buildconfig.includePaths
    cpp.libraryPaths: buildconfig.libraryPaths
//    cpp.minimummacosVersion: "10.7"
    cpp.cxxLanguageVersion: "c++14"

    Depends { name: "bundle" }
}
