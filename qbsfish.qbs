Project {
    // Some public API
    property bool staticBuild: false
    property bool frameworksBuild // autodetected in buildconfig
    property bool withTests: true

    name: "Qbs Fish"
    minimumQbsVersion: "1.16"
    references: [
         "src/src.qbs",
         "tests/tests.qbs",
    ]
    qbsSearchPaths: "qbs"

    AutotestRunner {}
}
