import qbs.base 1.0

FishProduct {
    type: project.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    destinationDirectory: project.install_library_path

    bundle.isBundle: false
    cpp.installNamePrefix: "@rpath/Frameworks/"
    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@loader_path/..", "@executable_path/.." ]
                : [ "$ORIGIN" ]

    Group {
        condition: !project.staticBuild
        fileTagsFilter: product.type
        qbs.install: true
        qbs.installDir: project.install_library_path
    }
}
