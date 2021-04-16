class InspectionCriteriaModel {
  final int idInspectionCriteria;
  final String txItemDescription;
  final int numFrequency;
  final String txHowToInspect;
  final String txPrimarySecuring;
  final String txSecondarySecuring;
  final String txSafetySecuring;

  InspectionCriteriaModel({
    this.idInspectionCriteria,
    this.txItemDescription,
    this.numFrequency,
    this.txHowToInspect,
    this.txPrimarySecuring,
    this.txSecondarySecuring,
    this.txSafetySecuring,
  });


  factory InspectionCriteriaModel.fromJson(Map<String, dynamic> json)  => InspectionCriteriaModel(
    idInspectionCriteria: json['id_InspectionCriteria'],
    txItemDescription: json['tx_ItemDescription'],
    numFrequency: json['num_Frequency'],
    txHowToInspect: json['tx_HowToInspect'],
    txPrimarySecuring: json['tx_PrimarySecuring'],
    txSecondarySecuring: json['tx_SecondarySecuring'],
    txSafetySecuring: json['tx_SafetySecuring'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;

    json['id_InspectionCriteria'] = idInspectionCriteria;
    json['tx_ItemDescription'] = txItemDescription;
    json['num_Frequency'] = numFrequency;
    json['tx_HowToInspect'] = txHowToInspect;
    json['tx_PrimarySecuring'] = txPrimarySecuring;
    json['tx_SecondarySecuring'] = txSecondarySecuring;
    json['tx_SafetySecuring'] = txSafetySecuring;

    return json;

  }
}
