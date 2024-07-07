import 'package:forme_app/features/trainee_features/home/data/models/workout_model.dart';

import '../../../../../core/models/trainee/user_model.dart';

class FeaturedWorkoutModel {
  final User user;
  final String slug;
  final bool verified;
  final Workout workouts;

  FeaturedWorkoutModel({
    required this.user,
    required this.slug,
    required this.verified,
    required this.workouts,
  });

  factory FeaturedWorkoutModel.fromJson(Map<String, dynamic> json) {
    return FeaturedWorkoutModel(
      user: User.fromJson(json['user']),
      slug: json['slug'],
      verified: json['verified'],
      workouts: Workout.fromJson(json['workouts']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'slug': slug,
      'verified': verified,
      'workouts': workouts.toJson(),
    };
  }
}