import 'package:serelizacao_arquivos_json_poc/app/models/area_model.dart';

class HomeViewController {


  Future<List<AreaModel>> synchronizeData() async {
    AreaModel area = AreaModel();
    await area.populateAreaTable();
    return await area.getAreas();

  }
}