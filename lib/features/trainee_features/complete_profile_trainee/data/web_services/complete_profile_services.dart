import 'package:forme_app/features/trainee_features/complete_profile_trainee/data/models/trainee_complete_profile_data_model.dart';
import '../../../../../core/api_services/api_services.dart';
import '../../../../../core/secrets_api_keys/secrets_api_keys.dart';
import '../models/complete_profile_response.dart';

class CompleteProfileServices {
  final ApiServices _webServices = ApiServices();

  Future<CompleteProfileResponse> uploadProfileData(
    TraineeCompleteProfileDataModel data,
  ) async {
    final requestData = data.toJson();
    final response = await _webServices.patch(
      '${SecretsApiKeys.baseUrl}/auth/complete_profile_trainee/',
      requestData,
    );
    return CompleteProfileResponse.fromJson(response.data);
  }
}
