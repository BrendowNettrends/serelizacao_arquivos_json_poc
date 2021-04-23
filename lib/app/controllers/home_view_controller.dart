import 'package:serelizacao_arquivos_json_poc/app/models/area_model.dart';
import 'package:serelizacao_arquivos_json_poc/app/models/item_model.dart';

class HomeViewController {


  Future<List<AreaModel>> synchronizeData() async {
    AreaModel area = AreaModel();
    area.populateAreaTable();
    return area.getAreas();
  }

}