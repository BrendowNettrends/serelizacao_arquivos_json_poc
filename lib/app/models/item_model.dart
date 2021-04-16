import 'dart:typed_data';

import 'package:serelizacao_arquivos_json_poc/app/utils/json_type.dart';

class ItemModel {



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
      photo: json['photo'],
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
        photo: json['photo'],
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
    Map<String, dynamic> json;

    if(toJsonType == JsonType.InternalDatabaseFormat) {
      json['id_Item'] = idItem;
      json['tx_Ref'] = txReference;
      json['photo'] = photo;
      json['txDescription'] = txDescription;
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
      json['txDescription'] = txDescription;
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
}
