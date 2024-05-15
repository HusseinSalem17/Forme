import 'session.dart';
import 'user.dart';

class TrainerModel {
  User? user;
  String? slug;
  String? bio;
  String? sportField;
  List<dynamic>? documentFiles;
  dynamic idCard;
  dynamic backgroundImage;
  int? numberOfTrainees;
  bool? expInjuries;
  bool? physicalDisabilities;
  dynamic experience;
  List<dynamic>? languages;
  dynamic facebookUrl;
  dynamic instagramUrl;
  dynamic youtubeUrl;
  bool? verified;
  List<dynamic>? reviews;
  List<dynamic>? programs;
  List<dynamic>? workouts;
  List<Session>? sessions;
  List<dynamic>? transformations;
  int? avgRatings;
  int? numberOfRatings;

  TrainerModel({
    this.user,
    this.slug,
    this.bio,
    this.sportField,
    this.documentFiles,
    this.idCard,
    this.backgroundImage,
    this.numberOfTrainees,
    this.expInjuries,
    this.physicalDisabilities,
    this.experience,
    this.languages,
    this.facebookUrl,
    this.instagramUrl,
    this.youtubeUrl,
    this.verified,
    this.reviews,
    this.programs,
    this.workouts,
    this.sessions,
    this.transformations,
    this.avgRatings,
    this.numberOfRatings,
  });

  factory TrainerModel.fromJson(Map<String, dynamic> json) {
    return TrainerModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      slug: json['slug'] as String?,
      bio: json['bio'] as String?,
      sportField: json['sport_field'] as String?,
      documentFiles: json['document_files'] as List<dynamic>?,
      idCard: json['id_card'] as dynamic,
      backgroundImage: json['background_image'] as dynamic,
      numberOfTrainees: json['number_of_trainees'] as int?,
      expInjuries: json['exp_injuries'] as bool?,
      physicalDisabilities: json['physical_disabilities'] as bool?,
      experience: json['experience'] as dynamic,
      languages: json['languages'] as List<dynamic>?,
      facebookUrl: json['facebook_url'] as dynamic,
      instagramUrl: json['instagram_url'] as dynamic,
      youtubeUrl: json['youtube_url'] as dynamic,
      verified: json['verified'] as bool?,
      reviews: json['reviews'] as List<dynamic>?,
      programs: json['programs'] as List<dynamic>?,
      workouts: json['workouts'] as List<dynamic>?,
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      transformations: json['transformations'] as List<dynamic>?,
      avgRatings: json['avg_ratings'] as int?,
      numberOfRatings: json['number_of_ratings'] as int?,
    );
  }
}
