import qbs.FileInfo

QbsCppApplication {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    cpp.rpaths: FileInfo.joinPaths(cpp.rpathOrigin,
                                   "..",
                                   qbs.targetOS.contains("macos")
                                   ? "Frameworks"
                                   : "lib/" + buildconfig.appTarget)
    cpp.minimumMacosVersion: "10.10"

    install: true
    installDir: buildconfig.installAppPath
}
