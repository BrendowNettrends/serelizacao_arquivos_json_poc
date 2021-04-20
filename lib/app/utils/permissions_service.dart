
import 'package:permission_handler/permission_handler.dart';

class PermissionsService  {

  Future<void> checkCameraPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.status;

    print(cameraStatus);

    if(!cameraStatus.isGranted) {
      await Permission.camera.request();
      cameraStatus = await Permission.camera.status;
    }


    print(cameraStatus);
  }


  Future<void> checkStoragePermission() async {
    PermissionStatus storageStatus =  await Permission.storage.status;

    print(storageStatus);

    if(!storageStatus.isGranted) {
      await Permission.storage.request();
      storageStatus =  await Permission.storage.status;
      print(storageStatus);
    }


  }
}