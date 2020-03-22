import qbs.FileInfo

QbsLibrary {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    Depends { name: "cpp" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.defines: buildconfig.staticBuild ? ["FISH_STATIC_LIBRARY"] : ["FISH_LIBRARY"]
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath" : undefined
    cpp.rpaths: cpp.rpathOrigin
    cpp.includePaths: ".."

    install: !isStaticLibrary
    installDir: buildconfig.installLibraryPath
    installDebugInformation: !isStaticLibrary

    Export {
        Depends { name: "cpp" }
        cpp.includePaths: ".."
        cpp.defines: product.isStaticLibrary ? ["FISH_STATIC_LIBRARY"] : []
    }
}
