import qbs.base 1.0

QbsCppApplication {
    Depends { name: "buildconfig" }
    type: ["application", "autotest"]
    consoleApplication: true
}
