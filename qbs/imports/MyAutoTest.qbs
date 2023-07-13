CppApplication {
    Depends { name: "buildconfig" }
    condition: project.withTests
    type: ["application", "autotest"]
    consoleApplication: true
    cpp.minimumMacosVersion: "10.10"
}
