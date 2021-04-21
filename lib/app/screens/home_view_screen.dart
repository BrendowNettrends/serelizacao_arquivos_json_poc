import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:serelizacao_arquivos_json_poc/app/controllers/home_view_controller.dart';
import 'package:serelizacao_arquivos_json_poc/app/helpers/external_data_source_repository.dart';
import 'package:serelizacao_arquivos_json_poc/app/models/area_model.dart';
import 'package:serelizacao_arquivos_json_poc/app/utils/permissions_service.dart';

class HomeViewScreen extends StatefulWidget {
  HomeViewScreen({Key key}) : super(key: key);

  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  PermissionsService _permissionsService = PermissionsService();
  ExternalDataSourceRepository externalDataSourceRepository =
      ExternalDataSourceRepository();
  HomeViewController controller = HomeViewController();

  Uint8List printImageBytes() {
    String base64String =
        "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";
    Uint8List bytes = base64Decode(base64String);

    return bytes;
  }

  @override
  void initState() {
    super.initState();
    _permissionsService.checkStoragePermission().then((_) {
      externalDataSourceRepository.createDataSourceDirectory().then((_) {
        controller.synchronizeData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Data from Json file"),
        actions: [
          IconButton(
            icon: Icon(Icons.sync_rounded),
            onPressed: controller.synchronizeData,
          )
        ],
      ),
      body: FutureBuilder(
          future: controller.synchronizeData(),
          builder: (context, AsyncSnapshot<List<AreaModel>> snapshot) {

            print(snapshot.data);

            return Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Card(
                      child: ListTile(
                        trailing: Text(
                          "${snapshot.data[index].idArea.toString()}",
                          style: TextStyle(fontSize: 28),
                        ),
                        title: Text(
                          snapshot.data[index].nomArea,
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
