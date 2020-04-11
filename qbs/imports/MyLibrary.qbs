import qbs.FileInfo

Library {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    Depends { name: "cpp" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.includePaths: [".."]
    cpp.defines: buildconfig.staticBuild ? ["FISH_STATIC_LIBRARY"] : ["FISH_LIBRARY"]
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath" : undefined
    cpp.rpaths: cpp.rpathOrigin

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: [".."]
        cpp.defines: buildconfig.staticBuild ? ["FISH_STATIC_LIBRARY"] : []
    }

    install: !buildconfig.staticBuild
    installDir: buildconfig.installLibraryPath
    installDebugInformation: !buildconfig.staticBuild
}
