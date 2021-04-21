import 'package:serelizacao_arquivos_json_poc/app/helpers/external_data_source_repository.dart';
import 'package:serelizacao_arquivos_json_poc/app/helpers/repository.dart';
import 'package:serelizacao_arquivos_json_poc/app/utils/json_table_name.dart';

class AreaModel {

  final String _areaTable = "Areas";

  final int idArea;
  final String nomArea;

  AreaModel({this.idArea, this.nomArea,});

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    idArea: json['id_Area'],
    nomArea: json['nom_Area'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;

    json['id_Area'] = idArea;
    json['nom_Area'] = nomArea;

    return json;

  }

  Future<void> populateAreaTable() async {
    ExternalDataSourceRepository externalDataSource = ExternalDataSourceRepository();
    Repository repository = Repository();

    List<Map<String, dynamic>> areas = externalDataSource
        .readFilesFromDataSourceDirectory(JsonTableName.AREA_TABLE);


    for (Map<String, dynamic> area in areas) {
      await repository.insertData(_areaTable, area);
    }
  }

  Future<void> createArea(AreaModel area) async {
    Repository repository = Repository();
    repository.insertData(_areaTable, area.toJson());
  }

  Future<List<AreaModel>> getAreas() async {
    Repository repository = Repository();
    List<AreaModel> areas = <AreaModel>[];

    List<Map<String, dynamic>> areasMap =
      await repository.readData(_areaTable);

    for (Map<String, dynamic>  area in areasMap) {
      areas.add(AreaModel.fromJson(area));
    }

    return areas;

  }




}