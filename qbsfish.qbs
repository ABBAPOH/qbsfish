Project {
    name: "Qbs Fish"

    qbsSearchPaths: "qbs"

    references: [
         "src/src.qbs",
         "tests/tests.qbs",
    ]

    AutotestRunner {}
}
