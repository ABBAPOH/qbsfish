import qbs.base 1.0
import qbs.FileInfo

QbsCppApplication {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    install: true
    installDir: buildconfig.install_app_path

    cpp.rpaths: qbs.targetOS.contains("macos")
                ? [ "@executable_path/../Frameworks" ]
                : [ "$ORIGIN/../lib/" + buildconfig.app_target ]
}
