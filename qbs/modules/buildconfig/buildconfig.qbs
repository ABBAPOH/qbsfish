import qbs 1.0

Module {
    property bool staticBuild: false
    property bool frameworksBuild: qbs.targetOS.contains("macos") && !staticBuild

    property string appTarget: qbs.targetOS.contains("macos") ? "Fish" : "fish"

    property string installAppPath: {
        if (qbs.targetOS.contains("macos"))
            return "Applications";
        else if (qbs.targetOS.contains("windows"))
            return ".";
        else
            return "bin";
    }

    property string installBinaryPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/MacOS"
        else
            return installAppPath
    }

    property string libSuffix: ""

    property string installLibraryPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/Frameworks"
        else if (qbs.targetOS.contains("windows"))
            return installAppPath
        else
            return "lib" + libSuffix + "/" + appTarget
    }

    property string installPluginPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/PlugIns"
        else
            return installLibraryPath + "/plugins"
    }

    property string installDataPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/Resources"
        else
            return "share/" + appTarget
    }

    property stringList includePaths: [ project.project_root + "/src" ]
    property stringList libraryPaths: []

    property stringList commonFlags: []
    property stringList cFlags: commonFlags
    property stringList cxxFlags: commonFlags
    property stringList linkFlags: commonFlags

    Depends { name: "cpp" }

    cpp.cxxFlags: buildconfig.cxxFlags
    cpp.linkerFlags: buildconfig.linkFlags
    cpp.includePaths: buildconfig.includePaths
    cpp.libraryPaths: buildconfig.libraryPaths
//    cpp.minimummacosVersion: "10.7"
    cpp.cxxLanguageVersion: "c++14"
}
