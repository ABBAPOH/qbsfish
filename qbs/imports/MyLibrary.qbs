import qbs.FileInfo

Library {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    Depends { name: "cpp" }
    type: project.staticBuild ? "staticlibrary" : "dynamiclibrary"

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.includePaths: [".."]
    cpp.defines: project.staticBuild ? ["FISH_STATIC_LIBRARY"] : ["FISH_LIBRARY"]
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath" : undefined
    cpp.rpaths: cpp.rpathOrigin

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: [".."]
        cpp.defines: project.staticBuild ? ["FISH_STATIC_LIBRARY"] : []
    }

    install: !project.staticBuild
    installDir: project.installLibraryPath
    installDebugInformation: !project.staticBuild
}
