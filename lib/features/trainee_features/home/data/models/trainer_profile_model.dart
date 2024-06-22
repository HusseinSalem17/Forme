import '../../../../../core/models/trainee/user_model.dart';

class TrainerProfile {
  final User user;
  final String slug;
  final String bio;
  final String sportField;
  final String? backgroundImage;
  final bool verified;
  final double avgRatings;
  final int numberOfRatings;

  TrainerProfile({
    required this.user,
    required this.slug,
    required this.bio,
    required this.sportField,
    this.backgroundImage,
    required this.verified,
    required this.avgRatings,
    required this.numberOfRatings,
  });

  factory TrainerProfile.fromJson(Map<String, dynamic> json) {
    return TrainerProfile(
      user: User.fromJson(json['user']),
      slug: json['slug'] ?? '',
      bio: json['bio'] ?? '',
      sportField: json['sport_field'] ?? '',
      backgroundImage: json['background_image'],
      verified: json['verified'] ?? false,
      avgRatings: json['avg_ratings'].toDouble(),
      numberOfRatings: json['number_of_ratings'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'slug': slug,
      'bio': bio,
      'sport_field': sportField,
      'background_image': backgroundImage,
      'verified': verified,
      'avg_ratings': avgRatings,
      'number_of_ratings': numberOfRatings,
    };
  }
}
