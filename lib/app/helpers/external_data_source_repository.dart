import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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



  Future<String> convertBase4toImage( String sourceString, [int id, String reference]) async {
    Uint8List _image = base64Decode(sourceString);
    final dir =  Directory( await _getInternalStoragePath());
    final File file = await File("${dir.path}/$id\_$reference.jpg").create();
    file.writeAsBytesSync(_image);
    final String filePath = file.path;
    return filePath;
  }


  Future<void> createDataSourceDirectory() async {

    String internalStoragePath = await _getInternalStoragePath();

    internalStoragePath  = internalStoragePath + "/DROPS";
    Directory directory = Directory(internalStoragePath);


    if(!await directory.exists()) {
      await directory.create(recursive: true);
    }

  }


  Future<List<Map<String, dynamic>>> readFilesFromDataSourceDirectory(String jsonName) async {

    Directory directory = Directory(await _getInternalStoragePath());

    String path = "${directory.path}/$jsonName.json";
    File jsonFile = File(path);

    var jsonData = jsonDecode(jsonFile.readAsStringSync());

    return jsonData.cast<Map<String, dynamic>>();
  }




}