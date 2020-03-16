import qbs 1.0

Module {
    property string app_target: qbs.targetOS.contains("macos") ? "Fish" : "fish"

    property string install_app_path: {
        if (qbs.targetOS.contains("macos"))
            return ".";
        else if (qbs.targetOS.contains("windows"))
            return ".";
        else
            return "bin";
    }

    property string install_binary_path: {
        if (qbs.targetOS.contains("macos"))
            return app_target + ".app/Contents/MacOS"
        else
            return install_app_path
    }

    property string lib_suffix: ""

    property string install_library_path: {
        if (qbs.targetOS.contains("macos"))
            return app_target + ".app/Contents/Frameworks"
        else if (qbs.targetOS.contains("windows"))
            return install_app_path
        else
            return "lib" + lib_suffix + "/" + app_target
    }

    property string install_plugin_path: {
        if (qbs.targetOS.contains("macos"))
            return app_target + ".app/Contents/PlugIns"
        else
            return install_library_path + "/plugins"
    }

    property string install_data_path: {
        if (qbs.targetOS.contains("macos"))
            return app_target + ".app/Contents/Resources"
        else
            return "share/" + app_target
    }

    property stringList includePaths: [ project.project_root + "/src" ]
    property stringList libraryPaths: []

    property stringList commonFlags: []
    property stringList cFlags: commonFlags
    property stringList cxxFlags: commonFlags
    property stringList linkFlags: commonFlags

    property string buildType: "dynamic"
    property bool staticBuild: buildType == "static"
    property bool frameworksBuild: qbs.targetOS.contains("macos") && buildType == "frameworks"
    property bool checkBuildType: {
        if (buildType != "static" && buildType != "dynamic" && buildType != "frameworks")
            throw "Invalid build type: should be one of [static, dynamic, frameworks]";
        return true;
    }

    Depends { name: "cpp" }
    Depends { name: "bundle" }

    cpp.cxxFlags: buildconfig.cxxFlags
    cpp.linkerFlags: buildconfig.linkFlags
    cpp.includePaths: buildconfig.includePaths
    cpp.libraryPaths: buildconfig.libraryPaths
//    cpp.minimummacosVersion: "10.7"
    cpp.cxxLanguageVersion: "c++14"
}
