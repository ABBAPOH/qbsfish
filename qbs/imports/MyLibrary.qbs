import qbs.base 1.0
import qbs.FileInfo

Product {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }
    type: buildconfig.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    bundle.isBundle: buildconfig.frameworksBuild
    cpp.sonamePrefix: qbs.targetOS.contains("macos") ? "@rpath/" : ""
    cpp.rpaths: cpp.rpathOrigin

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
        qbs.installSourceBase: destinationDirectory
    }
}
