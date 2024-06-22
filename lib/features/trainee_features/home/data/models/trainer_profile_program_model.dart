import '../../../../../core/models/trainee/user_model.dart';
import 'program_model.dart';

class TrainerProfileProgram {
  final User user;
  final String slug;
  final bool verified;
  final List<Program>? programs;

  TrainerProfileProgram({
    required this.user,
    required this.slug,
    required this.verified,
    this.programs,
  });

  factory TrainerProfileProgram.fromJson(Map<String, dynamic> json) {
    var programsFromJson = json['programs'] as List?;
    List<Program>? programsList = programsFromJson?.map((programJson) => Program.fromJson(programJson)).toList();

    return TrainerProfileProgram(
      user: User.fromJson(json['user']),
      slug: json['slug'],
      verified: json['verified'],
      programs: programsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'slug': slug,
      'verified': verified,
      'programs': programs?.map((program) => program.toJson()).toList(),
    };
  }
}
