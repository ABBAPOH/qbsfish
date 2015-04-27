import qbs.base 1.0

Project {
    SubProject {
        filePath: "app/app.qbs"
    }
    SubProject {
        filePath: "lib/lib.qbs"
    }
}

