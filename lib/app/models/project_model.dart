class ProjectModel {
  final int idProject;
  final String nomProject;
  final String nomClient;
  final String nomInstallation;
  final String dtProject;

  ProjectModel({
    this.idProject,
    this.nomProject,
    this.nomClient,
    this.nomInstallation,
    this.dtProject,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    idProject: json['id_Project'],
    nomProject: json['nom_Project'],
    nomClient: json['nom_Client'],
    nomInstallation: json['nom_Installation'],
    dtProject: json['dt_Project'],
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;

    json['id_Project'] = idProject;
    json['nom_Project'] = nomProject;
    json['nom_Client'] = nomClient;
    json['nom_Installation'] = nomInstallation;
    json['dt_Project'] = dtProject;


    return json;
  }
}
