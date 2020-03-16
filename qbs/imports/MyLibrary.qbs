import qbs.base 1.0
import qbs.FileInfo

Product {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    destinationDirectory: buildconfig.install_library_path

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath/Frameworks/" : ""
    cpp.rpaths: qbs.targetOS.contains("macos")
                ? [ "@loader_path/..", "@executable_path/.." ]
                : [ "$ORIGIN" ]

    Group {
        fileTagsFilter: {
            if (bundle.isBundle) {
                return ["bundle.content"];
            } else {
                var result = [
                            "dynamiclibrary",
                            "dynamiclibrary_symlink",
                            "dynamiclibrary_import",
                        ];
                if (qbs.debugInformation)
                    result.push("debuginfo_dll");
                return result;
            }
        }
        qbs.install: true
        qbs.installDir: buildconfig.install_library_path
        qbs.installSourceBase: project.buildDirectory + '/' + product.destinationDirectory
    }
}
