import qbs.base 1.0

Product {
    Depends { name: "cpp" }
    Depends { name: "mym" }

    cpp.cxxFlags: mym.cxxFlags
    cpp.linkerFlags: mym.linkFlags
    cpp.includePaths: mym.includePaths
    cpp.libraryPaths: mym.libraryPaths
//    cpp.minimummacosVersion: "10.7"
    cpp.cxxLanguageVersion: "c++14"

    Depends { name: "bundle" }
}
