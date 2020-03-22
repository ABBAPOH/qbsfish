Project {
    name: "Qbs Fish"

    qbsSearchPaths: "qbs"

    SubProject {
        filePath: "src/src.qbs"
    }
    SubProject {
        filePath: "tests/tests.qbs"
    }

    AutotestRunner {}
}

