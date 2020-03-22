import qbs.FileInfo

QbsCppApplication {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    cpp.rpaths: FileInfo.joinPaths(cpp.rpathOrigin,
                                   "..",
                                   qbs.targetOS.contains("macos")
                                   ? "Frameworks"
                                   : buildconfig.installLibraryPath)
    install: true
    installDir: buildconfig.installAppPath
    installDebugInformation: true
}
