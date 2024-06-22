import 'package:forme_app/core/api_services/api_services.dart';
import 'package:forme_app/core/secrets_api_keys/secrets_api_keys.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/server_errors.dart';
import '../models/trainer_profile_model.dart';

class HomeServices {
  final ApiServices apiServices;

  HomeServices({
    required this.apiServices,
  });

  Future<List<TrainerProfile>> getTopTrainers() async {
    try{
      final response = await apiServices
          .get('${SecretsApiKeys.baseUrl}/trainings/top-rated-trainers/');
      print(response.statusCode);
      List<dynamic> data = response.data;
      print(data.length);

      List<TrainerProfile> trainers = data
          .map((trainerJson) => TrainerProfile.fromJson(trainerJson))
          .toList();

      // Print the first two items
      if (trainers.isNotEmpty) {
        print('First Trainer: ${trainers[0].user.username}');
      }
      if (trainers.length > 1) {
        print('Second Trainer: ${trainers[1].user.username}');
      }

      return trainers;
    }
    catch (error) {
      print(error);
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while get top trainers data'),
      );
    }
  }
}
