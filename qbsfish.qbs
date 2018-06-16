import qbs.base 1.0

Project {
    name: "Qbs Fish"

    property string project_root: path

    qbsSearchPaths: "qbs"

    SubProject {
        filePath: "src/src.qbs"
    }
    SubProject {
        filePath: "tests/tests.qbs"
    }

    AutotestRunner {}
}

