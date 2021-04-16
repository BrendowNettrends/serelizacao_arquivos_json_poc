class LocationModel {

  final int idLocation;
  final String nomLocation;

  LocationModel({this.idLocation, this.nomLocation,});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    idLocation: json['id_Location'],
    nomLocation: json['nom_Location'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;

    json['id_Location'] = idLocation;
    json['nom_Location'] = nomLocation;

    return json;
  }

}