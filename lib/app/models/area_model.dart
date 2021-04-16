class AreaModel {

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


}