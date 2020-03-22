import qbs.FileInfo

QbsLibrary {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.defines: buildconfig.staticBuild ? ["FISH_STATIC_LIBRARY"] : ["FISH_LIBRARY"]
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath/" : ""
    cpp.rpaths: cpp.rpathOrigin
    cpp.minimumMacosVersion: "10.10"
    cpp.includePaths: ".."

    install: true
    installDir: buildconfig.installLibraryPath

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ".."
        cpp.defines: buildconfig.staticBuild ? ["FISH_STATIC_LIBRARY"] : []
    }

    Group {
        condition: cpp.separateDebugInformation
        fileTagsFilter: "debuginfo_dll"
        qbs.install: true
        qbs.installDir: buildconfig.installLibraryPath
        qbs.installSourceBase: destinationDirectory
    }
}
