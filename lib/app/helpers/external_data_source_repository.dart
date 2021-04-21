import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ExternalDataSourceRepository {

  Future<String> _getInternalStoragePath() async {

    Directory directory = await getExternalStorageDirectory();

    String newPath = "";

    List<String> paths = directory.path.split("/");
    for(int x = 1; x < paths.length; x++) {
      String folder = paths[x];
      if(folder != "Android") {
        newPath += "/" + folder;
      } else {
        break;
      }
    }

    return newPath;
  }


  Future<void> createDataSourceDirectory() async {

    String internalStoragePath = await _getInternalStoragePath();

    internalStoragePath  = internalStoragePath + "/DROPS";
    Directory directory = Directory(internalStoragePath);

    if(!await directory.exists()) {
      await directory.create(recursive: true);
    }

  }


  List<Map<String, dynamic>> readFilesFromDataSourceDirectory(String jsonName) {

    Directory directory = Directory("/storage/emulated/0/DROPS");

    String path = "${directory.path}/$jsonName.json";
    File jsonFile = File(path);

    var jsonData = jsonDecode(jsonFile.readAsStringSync());

    return jsonData.cast<Map<String, dynamic>>();
  }


}