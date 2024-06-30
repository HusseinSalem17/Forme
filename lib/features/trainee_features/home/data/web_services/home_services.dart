import 'package:forme_app/core/api_services/api_services.dart';
import 'package:forme_app/core/secrets_api_keys/secrets_api_keys.dart';
import 'package:forme_app/features/trainee_features/home/data/models/trainer_profile_program_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/server_errors.dart';
import '../models/trainer_profile_model.dart';

class HomeServices {
  final ApiServices apiServices;

  HomeServices({
    required this.apiServices,
  });

  Future<List<TrainerProfile>> getTopTrainers() async {
    try {
      final response = await apiServices
          .get('${SecretsApiKeys.baseUrl}/trainings/top-rated-trainers/');

      List<dynamic> data = response.data;

      List<TrainerProfile> trainers = data
          .map((trainerJson) => TrainerProfile.fromJson(trainerJson))
          .toList();
      print(trainers[0].user.profilePicture);

      return trainers;
    } catch (error) {
      print(error);
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while get top trainers data'),
      );
    }
  }

  Future<List<TrainerProfileProgram>> getSpecialPrograms() async {
    try {
      final response = await apiServices
          .get('${SecretsApiKeys.baseUrl}/trainings/programs-list/');

      List<dynamic> data = response.data;

      List<TrainerProfileProgram> specialPrograms = data
          .map((trainerJson) => TrainerProfileProgram.fromJson(trainerJson))
          .toList();
      print(specialPrograms[0].user.profilePicture);

      return specialPrograms;
    } catch (error) {
      print(error);
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while get special programs '),
      );
    }
  }
}
