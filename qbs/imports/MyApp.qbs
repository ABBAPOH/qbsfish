import qbs.base 1.0
import qbs.FileInfo

QbsCppApplication {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    install: true
    installDir: buildconfig.installAppPath

    cpp.rpaths: FileInfo.joinPaths(cpp.rpathOrigin,
                                   "..",
                                   qbs.targetOS.contains("macos")
                                   ? "Frameworks"
                                   : "lib/" + buildconfig.appTarget)
}
