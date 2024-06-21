import 'package:forme_app/core/models/trainee/user_model.dart';

class CompleteProfileResponse {
  final User user;
  final String? fitnessGoals;
  final String? currentPhysicalLevel;
  final List<String> programs;
  final List<String> workouts;

  CompleteProfileResponse({
    required this.user,
    this.fitnessGoals,
    this.currentPhysicalLevel,
    required this.programs,
    required this.workouts,
  });

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) {
    return CompleteProfileResponse(
      user: User.fromJson(json['user']),
      fitnessGoals: json['fitness_goals'],
      currentPhysicalLevel: json['current_physical_level'],
      programs: List<String>.from(json['programs']),
      workouts: List<String>.from(json['workouts']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'fitness_goals': fitnessGoals,
      'current_physical_level': currentPhysicalLevel,
      'programs': programs,
      'workouts': workouts,
    };
  }
}
