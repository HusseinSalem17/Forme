import 'package:forme_app/core/api_services/api_services.dart';
import 'package:forme_app/core/secrets_api_keys/secrets_api_keys.dart';
import '../models/trainer_profile_model.dart';

class HomeServices {
  final ApiServices apiServices;

  HomeServices({
    required this.apiServices,
  });

  Future<List<TrainerProfile>> getTopTrainers() async {
    final response = await apiServices
        .get('${SecretsApiKeys.baseUrl}/auth/complete_profile_trainee/');
    List<dynamic> data = response.data;
    return data
        .map((trainerJson) => TrainerProfile.fromJson(trainerJson))
        .toList();
  }
}
