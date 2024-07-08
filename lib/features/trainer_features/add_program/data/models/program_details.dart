import 'package:forme_app/features/trainer_features/add_program/data/models/program_plans.dart';

class ProgramDataModel {
  final String? cover;
  final String title;
  final int? capacity;

  final String? sportField;
  final String? level;
  final String? type;

  final String? description;
  final String? gender;
  final int? minAge;
  final int? maxAge;
  //final List<ProgramPlansModel> plans;

  ProgramDataModel({
    required this.title,
    this.cover,
    this.type,
    this.capacity,
    this.sportField,
    this.level,
    this.description,
    this.gender,
    this.minAge,
    this.maxAge,
    //this.plans
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (cover != null) 'picture': cover,
      if (capacity != null) 'program_capacity': capacity,
      if (sportField != null) "sport_field": sportField,
      if (level != null) "level": level,
      if (description != null) "description": description,
      if (gender != null) "target_gender": gender,
      if (minAge != null) "min_age": minAge,
      if (maxAge != null) "max_age": maxAge,
      "program_plans": [
        {
          "duration_in_weeks": 2147483647,
          "price": "string",
          "is_offer": true,
          "offer_price": "string",
          "max_trainees": "string"
        }
      ]
    };
  }

  factory ProgramDataModel.fromJson(Map<String, dynamic> json) {
    return ProgramDataModel(
      title: json["title"],
      //cover: json["picture"],
      capacity: json["program_capacity"],
      sportField: json["sport_field"],
      level: json["level"],
      type: json["type"],
      description: json["description"],
      gender: json["target_gender"],
      minAge: json["min_age"],
      maxAge: json["max_age"],
      //files: json["workout_files"],
    );
  }
}
