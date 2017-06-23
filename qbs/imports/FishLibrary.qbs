import qbs.base 1.0
import qbs.FileInfo

FishProduct {
    type: project.staticBuild ? "staticlibrary" : "dynamiclibrary"
    Depends { name: "cpp" }

    destinationDirectory: project.install_library_path

    bundle.isBundle: project.frameworksBuild
    cpp.installNamePrefix: "@rpath/Frameworks/"
    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@loader_path/..", "@executable_path/.." ]
                : [ "$ORIGIN" ]

    Group {
        condition: !project.staticBuild
        fileTagsFilter: ["dynamiclibrary"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? FileInfo.joinPaths(project.install_library_path, FileInfo.path(bundle.executablePath))
                        : project.install_library_path
    }

    Group {
        condition: !project.staticBuild
        fileTagsFilter: ["dynamiclibrary_symlink"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? project.install_library_path + "/" + bundle.bundleName
                        : project.install_library_path
    }

    Group {
        condition: !project.staticBuild
        fileTagsFilter: ["infoplist"]
        qbs.install: bundle.isBundle && !bundle.embedInfoPlist
        qbs.installDir: FileInfo.joinPaths(project.install_library_path, FileInfo.path(bundle.infoPlistPath))
    }

    Group {
        condition: !project.staticBuild
        fileTagsFilter: ["pkginfo"]
        qbs.install: bundle.isBundle
        qbs.installDir: FileInfo.joinPaths(project.install_library_path, FileInfo.path(bundle.pkgInfoPath))
    }
}
