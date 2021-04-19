import 'dart:html';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import 'package:path_provider/path_provider.dart';

class ExternalDataSourceRepository {

  void checkPer() async {
    await new Future.delayed(new Duration(seconds: 1));
    bool checkResult = await Permission.storage.status.isGranted;
    if (!checkResult) {
      var status = await SimplePermissions.requestPermission(
          Permission.WriteExternalStorage);
      //print("permission request result is " + resReq.toString());
      if (status == PermissionStatus.authorized) {
        await downloadFile();
      }
    } else {
      await downloadFile();
    }
  }

  Future<void> createDataSourceDirectory() async {
    Directory directory = await getExternalStorageDirectory();

    String fileName = 'xyz.pdf';
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


    newPath  = newPath + "/DROPS/DataSource";
    directory = Directory(newPath);

    print(newPath);


    if(!await directory.exists()) {
      await directory.create(recursive: true);
    }
    // if(!await directory.exists()) {
    //   final File file =  File(directory.path + "/$fileName");
    // }
  }
}