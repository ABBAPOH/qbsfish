Project {
    name: "Qbs Fish"
    minimumQbsVersion: "1.16"
    references: [
         "src/src.qbs",
         "tests/tests.qbs",
    ]
    qbsSearchPaths: "qbs"

    AutotestRunner {}
}
