import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:serelizacao_arquivos_json_poc/app/utils/json_table_names.dart';

class ExternalDataSourceRepository {

  Future<void> createDataSourceDirectory() async {
    Directory directory = await getExternalStorageDirectory();

    String newPath = "";
    print(directory);

    List<String> paths = directory.path.split("/");
    for(int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if(folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }
    newPath  = newPath + "/DROPS";
    directory = Directory(newPath);

    print(newPath);

    if(!await directory.exists()) {
      await directory.create(recursive: true);
    }

  }

  void readFilesFromDataSourceDirectory() {

    List<String> jsonNames = JSON_NAMES;
    List<dynamic> json;

    Directory directory = Directory("/storage/emulated/0/DROPS");


    jsonNames.forEach((name)  {
      String path = directory.path + "/" + name + ".json";
      var file = File(path);
      file ??= File("");
      json.add(file);
    });

  }
}