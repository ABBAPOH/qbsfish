import qbs.base 1.0
import qbs.FileInfo

MyProduct {
    type: mym.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    destinationDirectory: mym.install_library_path

    bundle.isBundle: mym.frameworksBuild
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath/Frameworks/" : ""
    cpp.rpaths: qbs.targetOS.contains("macos")
                ? [ "@loader_path/..", "@executable_path/.." ]
                : [ "$ORIGIN" ]

    Group {
        fileTagsFilter: bundle.isBundle
                        ? ["bundle.content"]
                        : ["dynamiclibrary", "dynamiclibrary_symlink", "dynamiclibrary_import"]
//        fileTagsFilter: product.type
        qbs.install: true
        qbs.installDir: mym.install_library_path
//        qbs.installSourceBase: project.buildDirectory + '/' + product.destinationDirectory
    }
}
