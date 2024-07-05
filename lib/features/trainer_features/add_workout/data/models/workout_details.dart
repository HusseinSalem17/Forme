import 'package:image_picker/image_picker.dart';

class WorkoutDataModel {
  final XFile? cover;
  final String title;
  final int price;
  final bool isOffer;
  final int? offerPrice;
  final String sportField;
  final String level;
  final String description;
  final String? gender;
  final int? minAge;
  final int? maxAge;
  //final List<WorkOutFilesModel>? files;

  WorkoutDataModel({
    required this.title,
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
    //this.files
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (cover != null) 'picture': cover,
      'price': price,
      "is_offer": isOffer,
      if (isOffer) "offer_price": offerPrice,
      "sport_field": sportField,
      "level": level,
      "description": description,
      if (gender != null) "target_gender": gender,
      if (minAge != null) "min_age": minAge,
      if (maxAge != null) "max_age": maxAge,
      "workout_files": [
        {"title": "string", "details": "string"}
      ]
    };
  }

  factory WorkoutDataModel.fromJson(Map<String, dynamic> json) {
    return WorkoutDataModel(
      title: json["title"],
      //cover: json["picture"],
      price: json["price"],
      isOffer: json["is_offer"],
      offerPrice: json["offer_price"],
      sportField: json["sport_field"],
      level: json["level"],
      description: json["description"],
      gender: json["target_gender"],
      minAge: json["min_age"],
      maxAge: json["max_age"],
      //files: json["workout_files"],
    );
  }
}
