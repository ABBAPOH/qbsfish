import qbs.base 1.0
import qbs.FileInfo
import qbs.TextFile

Project {
    name: "app"
Product {
    type: "file"
    name: "File"
    files: [ "file.txt" ]

    Transformer {
        inputs: "file.txt"
        Artifact {
            filePath: ".dummy" // never created
            fileTags: "processed_file"
        }
        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.description = "Processing '" + input.filePath + "'";
            cmd.highlight = "codegen";
            cmd.sourceCode = function() {
                var file = new TextFile(input.filePath);
                var acc = file.readAll();
                file.close()
                var cpu = [0];
                var j = 0;
                var brc = 0;
                var result = "";
                for (var i = 0; i < acc.length; i++) {
                    if(acc[i] == '>') j++;
                    if(acc[i] == '<') j--;
                    if(acc[i] == '+') cpu[j]++;
                    if(acc[i] == '-') cpu[j]--;
                    if(acc[i] == '.') result += String.fromCharCode(cpu[j]);
                    if(acc[i] == ',') result += String.fromCharCode(cpu[j]);
                    if(acc[i] == '[')
                    {
                        if(!cpu[j])
                        {
                            ++brc;
                            while(brc)
                            {
                                ++i;
                                if (acc[i] == '[') ++brc;
                                if (acc[i] == ']') --brc;
                            }
                        }else continue;
                    }
                    else if(acc[i] == ']')
                    {
                        if(!cpu[j])
                        {
                            continue;
                        }
                        else
                        {
                            if(acc[i] == ']') brc++;
                            while(brc)
                            {
                                --i;
                                if(acc[i] == '[') brc--;
                                if(acc[i] == ']') brc++;
                            }
                            --i;
                        }
                    }
                }
                print(result);
            }
            return cmd;
        }
    }
}

FishProduct {
    type: "application"
    name: project.app_target
    destinationDirectory: project.install_app_path

    cpp.rpaths: qbs.targetOS.contains("osx")
                ? [ "@executable_path/.." ]
                : [ "$ORIGIN/../lib/" + project.app_target ]

    Depends { name: "Qt.core" }
    Depends { name: "Qt.widgets" }
    Depends { name: "Lib" }
    Depends { name: "File" }

    files: [ "*.cpp", "*.h" ]

    bundle.infoPlistFile: "Info.plist.in"

    Group {
        fileTagsFilter: ["application"]
        qbs.install: true
        qbs.installDir: bundle.isBundle
                        ? FileInfo.joinPaths(install_app_path, FileInfo.path(bundle.executablePath))
                        : install_app_path
    }

    Group {
        name: ".icns"
        condition: qbs.targetOS.contains("osx")
        files: "Fish.icns"
        qbs.install: true
        qbs.installDir: install_data_path
    }

    Group {
        fileTagsFilter: ["infoplist"]
        qbs.install: true && bundle.isBundle && !bundle.embedInfoPlist
        qbs.installDir: FileInfo.joinPaths(install_app_path, FileInfo.path(bundle.infoPlistPath))
    }
}
}
