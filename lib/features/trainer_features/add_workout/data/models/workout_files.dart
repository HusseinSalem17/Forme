
class WorkOutFilesModel {
  //final File cover
  final String title;
  final String details;

  WorkOutFilesModel({
    required this.title,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'details': details,
    };
  }

  factory WorkOutFilesModel.fromJson(Map<String, dynamic> json) {
    return WorkOutFilesModel(
      title: json["title"],
      details: json["details"],
    );
  }
}
