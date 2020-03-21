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
    cpp.minimumMacosVersion: "10.10"
    cpp.includePaths: ".."
    install: true
    installDir: buildconfig.installLibraryPath

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ".."
    }

    Group {
        condition: cpp.separateDebugInformation
        fileTagsFilter: "debuginfo_dll"
        qbs.install: true
        qbs.installDir: buildconfig.installLibraryPath
        qbs.installSourceBase: destinationDirectory
    }
}
