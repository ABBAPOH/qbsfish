Module {
    property bool staticBuild: false
    property bool frameworksBuild: qbs.targetOS.contains("macos") && !staticBuild
    property string libDirName: "lib"

    property bool enableAddressSanitizer: false
    property bool enableUbSanitizer: false
    property bool enableThreadSanitizer: false

    readonly property string appTarget: qbs.targetOS.contains("macos") ? "Fish" : "fish"

    readonly property string installAppPath: {
        if (qbs.targetOS.contains("macos"))
            return "Applications";
        else if (qbs.targetOS.contains("windows"))
            return ".";
        else
            return "bin";
    }

    readonly property string installBinaryPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/MacOS"
        else
            return installAppPath
    }

    readonly property string installLibraryPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/Frameworks"
        else if (qbs.targetOS.contains("windows"))
            return installAppPath
        else
            return libDirName + "/" + appTarget
    }

    readonly property string installPluginPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/PlugIns"
        else
            return installLibraryPath + "/plugins"
    }

    readonly property string installDataPath: {
        if (qbs.targetOS.contains("macos"))
            return installAppPath + "/" + appTarget + ".app/Contents/Resources"
        else
            return "share/" + appTarget
    }

    Depends { name: "cpp" }

    cpp.cxxLanguageVersion: "c++17"

    Properties {
        condition: qbs.toolchain.contains("gcc")
        cpp.cxxFlags: {
            var flags = [];
            if (enableAddressSanitizer)
                flags.push("-fno-omit-frame-pointer");
            return flags;
        }
        cpp.driverFlags: {
            var flags = [];
            if (enableAddressSanitizer)
                flags.push("-fsanitize=address");
            if (enableUbSanitizer)
                flags.push("-fsanitize=undefined");
            if (enableThreadSanitizer)
                flags.push("-fsanitize=thread");
            return flags;
        }
    }
}
