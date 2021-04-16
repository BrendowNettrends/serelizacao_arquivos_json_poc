class GradeModel {

  final int idGrade;
  final String txGrade;

  GradeModel({this.idGrade, this.txGrade});

  factory GradeModel.fromJson(Map<String, dynamic> json) => GradeModel(
    idGrade: json['id_Grade'],
    txGrade: json['tx_Grade'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;

    json['id_Grade'] = idGrade;
    json['tx_Grade'] = txGrade;

    return json;
  }

}