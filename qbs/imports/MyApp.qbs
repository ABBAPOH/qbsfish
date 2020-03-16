import qbs.base 1.0
import qbs.FileInfo

QbsCppApplication {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    install: true
    installDir: buildconfig.install_app_path

    cpp.rpaths: FileInfo.joinPaths(cpp.rpathOrigin,
                                   "..",
                                   qbs.targetOS.contains("macos")
                                   ? "Frameworks"
                                   : "lib/" + buildconfig.app_target)
}
