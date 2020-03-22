import qbs.FileInfo

QbsLibrary {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.defines: buildconfig.staticBuild ? ["FISH_STATIC_LIBRARY"] : ["FISH_LIBRARY"]
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath" : undefined
    cpp.rpaths: cpp.rpathOrigin
    cpp.minimumMacosVersion: "10.10"
    cpp.includePaths: ".."

    install: !isStaticLibrary
    installDir: buildconfig.installLibraryPath
    installDebugInformation: true

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ".."
        cpp.defines: product.isStaticLibrary ? ["FISH_STATIC_LIBRARY"] : []
    }
}
