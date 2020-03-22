Project {
    name: "Qbs Fish"
    references: [
         "src/src.qbs",
         "tests/tests.qbs",
    ]
    qbsSearchPaths: "qbs"

    AutotestRunner {}
}
