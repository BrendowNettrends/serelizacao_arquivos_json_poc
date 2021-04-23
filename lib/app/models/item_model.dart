import 'dart:convert';
import 'dart:typed_data';

import 'package:serelizacao_arquivos_json_poc/app/helpers/external_data_source_repository.dart';
import 'package:serelizacao_arquivos_json_poc/app/helpers/repository.dart';
import 'package:serelizacao_arquivos_json_poc/app/utils/json_table_name.dart';
import 'package:serelizacao_arquivos_json_poc/app/utils/json_type.dart';

class ItemModel {

  final String _itemTable = "Items";

  final int idItem;
  final String txReference;
  final Uint8List photo;
  final String txDescription;
  final int idInspectionCriteria;
  final String dtDate;
  final String txCondition;
  final String txComments;
  final int blCondition;
  final int idLocation;
  final String numLevel;
  final int idGrade;
  final int idProject;
  final String howToInspect;
  final String primarySecuring;
  final String secondarySecuring;
  final String safetySecuring;
  final int idZone;
  final int frequency;
  final int blClosedDefect;

  ItemModel({
    this.idItem,
    this.txReference,
    this.photo,
    this.txDescription,
    this.idInspectionCriteria,
    this.dtDate,
    this.txCondition,
    this.txComments,
    this.blCondition,
    this.idLocation,
    this.numLevel,
    this.idGrade,
    this.idProject,
    this.howToInspect,
    this.primarySecuring,
    this.secondarySecuring,
    this.safetySecuring,
    this.idZone,
    this.frequency,
    this.blClosedDefect,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json, [JsonType fromJsonType = JsonType.ExportFormat]) => fromJsonType == JsonType.ExportFormat ?
    ItemModel(
      idItem: json['id_Item'],
      txReference: json['tx_Ref'],
      photo: base64Decode(json['photo']),
      txDescription: json['txDescription'],
      idInspectionCriteria: json['id_InspectionCriteria'],
      dtDate: json['dt_Date'],
      txCondition: json['tx_Condition'],
      txComments: json['tx_Comments'],
      blCondition: (json['bl_Condition']) ? 1 : 0,
      idLocation: json['id_Location'],
      numLevel: json['num_Level'],
      idGrade: json['id_Grade'],
      idProject: json['id_Project'] ?? 0,
      howToInspect: json['HowToInspect'],
      primarySecuring: json['PrimarySecuring'],
      secondarySecuring: json['SecondarySecuring'],
      safetySecuring: json['SafetySecuring'],
      idZone: json['id_Zone'],
      frequency: json['Frequency'],
      blClosedDefect: (json['bl_ClosedDefect']) ? 1 : 0,
    ) :
    ItemModel(
        idItem: json['id_Item'],
        txReference: json['tx_Ref'],
        photo: base64Decode(json['photo']),
        txDescription: json['txDescription'],
        idInspectionCriteria: json['id_InspectionCriteria'],
        dtDate: json['dt_Date'],
        txCondition: json['tx_Condition'],
        txComments: json['tx_Comments'],
        blCondition: json['bl_Condition'],
        idLocation: json['id_Location'],
        numLevel: json['num_Level'],
        idGrade: json['id_Grade'],
        idProject: json['id_Project'] ?? 0,
        howToInspect: json['HowToInspect'],
        primarySecuring: json['PrimarySecuring'],
        secondarySecuring: json['SecondarySecuring'],
        safetySecuring: json['SafetySecuring'],
        idZone: json['id_Zone'],
        frequency: json['Frequency'],
        blClosedDefect: json['bl_ClosedDefect'],
    );


  Map<String, dynamic> toJson([JsonType toJsonType = JsonType.InternalDatabaseFormat]) {
    Map<String, dynamic> json = Map<String, dynamic>();

    if(toJsonType == JsonType.InternalDatabaseFormat) {
      json['id_Item'] = idItem;
      json['tx_Ref'] = txReference;
      json['photo'] = photo;
      json['tx_Description'] = txDescription;
      json['id_InspectionCriteria'] = idInspectionCriteria;
      json['dt_Date'] = dtDate;
      json['tx_Condition'] = txCondition;
      json['tx_Comments'] = txComments;
      json['bl_Condition'] = blCondition;
      json['id_Location'] = idLocation;
      json['num_Level'] = numLevel;
      json['id_Grade'] = idGrade;
      json['id_Project'] = idProject ?? 0;
      json['HowToInspect'] = howToInspect;
      json['PrimarySecuring'] = primarySecuring;
      json['SecondarySecuring'] = secondarySecuring;
      json['SafetySecuring'] = safetySecuring;
      json['id_Zone'] = idZone;
      json['Frequency'] = frequency;
      json['bl_ClosedDefect'] = blClosedDefect;
    } else {
      json['id_Item'] = idItem;
      json['tx_Ref'] = txReference;
      json['photo'] = photo;
      json['tx_Description'] = txDescription;
      json['id_InspectionCriteria'] = idInspectionCriteria;
      json['dt_Date'] = dtDate;
      json['tx_Condition'] = txCondition;
      json['tx_Comments'] = txComments;
      json['bl_Condition'] = (blCondition == 1) ? true : false;
      json['id_Location'] = idLocation;
      json['num_Level'] = numLevel;
      json['id_Grade'] = idGrade;
      json['id_Project'] = idProject ?? 0;
      json['HowToInspect'] = howToInspect;
      json['PrimarySecuring'] = primarySecuring;
      json['SecondarySecuring'] = secondarySecuring;
      json['SafetySecuring'] = safetySecuring;
      json['id_Zone'] = idZone;
      json['Frequency'] = frequency;
      json['bl_ClosedDefect'] = (blClosedDefect == 1) ? true : false;
    }

    return json;
  }

  Future<void> populateItemTable() async {
    ExternalDataSourceRepository externalDataSource = ExternalDataSourceRepository();
    Repository repository = Repository();

    List<ItemModel> items = <ItemModel>[];

    List<Map<String, dynamic>> databaseData = await repository.readData(_itemTable);
    List<ItemModel> itemFromDatabase;
    itemFromDatabase = databaseData
        .map((element) => ItemModel.fromJson(element)).toList();

    List<ItemModel> itemFromExternalData;
    List<Map<String, dynamic>> externalData = await externalDataSource
        .readFilesFromDataSourceDirectory(JsonTableName.ITEM_TABLE);

    itemFromExternalData = externalData.map((element) => ItemModel.fromJson(element)).toList();


    items = itemFromExternalData.where((element) {
      bool contains = false;

      for(ItemModel item in itemFromDatabase) {
        if (item.idItem == element.idItem) {
          contains = true;
          break;
        }
      }
      return !contains;
    }).toList();


    for (ItemModel itemModel in items) {
      repository.insertData(_itemTable, itemModel.toJson());
    }


  }

  Future<List<ItemModel>> getItems() async {
    Repository repository = Repository();
    List<ItemModel> items = <ItemModel>[];

    List<Map<String, dynamic>> itemsMap =
    await repository.readData(_itemTable);

    for (Map<String, dynamic>  item in itemsMap) {
      items.add(ItemModel.fromJson(item));
    }

    return items;

  }
}
