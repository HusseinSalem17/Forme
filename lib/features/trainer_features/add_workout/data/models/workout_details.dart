
import 'package:forme_app/core/gender.dart';
import 'package:forme_app/features/trainer_features/add_workout/data/models/workout_files.dart';

class WorkoutDataModel {
  final String? cover;
  final String title;
  final int price;
  final bool isOffer;
  final int? offerPrice;
  final String sportField;
  final String level;
  final String description;
  final Gender? gender;
  final int? minAge;
  final int? maxAge;
  final List<WorkOutFilesModel>? files;

  WorkoutDataModel(
      {required this.title,
      this.cover,
      required this.price,
      this.isOffer = false,
      this.offerPrice,
      required this.sportField,
      required this.level,
      required this.description,
      this.gender,
      this.minAge,
      this.maxAge,
      this.files});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'picture': cover,
      'price': price,
      "is_offer": isOffer,
      "offer_price": offerPrice ?? 0,
      "sport_field": sportField,
      "level": level,
      "description": description,
      "target_gender": gender,
      "min_age": minAge,
      "max_age": maxAge,
      "workout_files": files
    };
  }

  factory WorkoutDataModel.fromJson(Map<String, dynamic> json) {
    return WorkoutDataModel(
      title: json["title"],
      cover: json["picture"],
      price: json["price"],
      isOffer: json["is_offer"],
      offerPrice: json["offer_price"],
      sportField: json["sport_field"],
      level: json["level"],
      description: json["description"],
      gender: json["target_gender"],
      minAge: json["min_age"],
      maxAge: json["max_age"],
      files: json["workout_files"],
    );
  }
}
