class ZoneModel {

  final int idZone;
  final int idArea;
  final String nomZone;
  final String nomZoneDescription;

  ZoneModel({this.idZone, this.idArea, this.nomZone, this.nomZoneDescription,});


  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
    idZone: json['id_Zone'],
    idArea: json['id_Area'],
    nomZone: json['nom_Zone'],
    nomZoneDescription: json['nom_ZoneDescription'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;

    json['id_Zone'] = idZone;
    json['id_Area'] = idArea;
    json['nom_Zone'] = nomZone;
    json['nom_ZoneDescription'] = nomZoneDescription;

    return json;
  }
}