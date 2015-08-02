import qbs.base 1.0

Product {
    Depends { name: "cpp" }

    cpp.cxxFlags: project.cxxFlags
    cpp.linkerFlags: project.linkFlags
    cpp.includePaths: project.includePaths
    cpp.libraryPaths: project.libraryPaths
    cpp.minimumOsxVersion: "10.7"
    cpp.cxxLanguageVersion: "c++11"

    Depends { name: "bundle" }
}
