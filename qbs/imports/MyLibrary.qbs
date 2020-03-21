import qbs.base 1.0
import qbs.FileInfo

QbsLibrary {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath/" : ""
    cpp.rpaths: cpp.rpathOrigin
    install: true
    installDir: buildconfig.installLibraryPath

    Group {
        condition: cpp.separateDebugInformation
        fileTagsFilter: "debuginfo_dll"
        qbs.install: true
        qbs.installDir: buildconfig.installLibraryPath
        qbs.installSourceBase: destinationDirectory
    }
}
