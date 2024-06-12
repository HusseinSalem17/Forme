import 'dart:io';
import 'package:dio/dio.dart';
import 'package:forme_app/core/secrets/secrets_api_keys.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/data/models/profile_data_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/server_errors.dart';
import '../models/profile_data_uploaded_successful_model.dart';

class CompleteProfileServices {
  final Dio _dio = Dio();

  Future<ProfileDataUploadedSuccessfulModel> uploadProfileData(
      TraineeCompleteProfileDataModel data) async {
    try {
      Response response = await _dio.patch(
        '${SecretsApiKeys.baseUrl}/auth/complete_profile_trainee/',
        data: data.toJson(),
      );
      return response.data;
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
          error,
          'Error occurred while upload your data',
        ),
      );
    }
  }
}
