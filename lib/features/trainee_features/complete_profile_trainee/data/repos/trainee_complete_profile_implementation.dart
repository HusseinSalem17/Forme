import 'package:dartz/dartz.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/data/models/profile_data_model.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/data/repos/trainee_complete_profile_repo.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/server_errors.dart';
import '../models/profile_data_uploaded_successful_model.dart';
import '../web_services/complete_profile_services.dart';

class TrainerCompleteProfileRepoImpl implements TraineeCompleteProfileRepo {
  CompleteProfileServices completeProfileServices = CompleteProfileServices();

  @override
  Future<Either<CustomError, ProfileDataUploadedSuccessfulModel>>
      updateTraineeCompleteProfile({
    required TraineeCompleteProfileDataModel data,
  }) async {
    try {
      final response = await completeProfileServices.uploadProfileData(data);
      return right(response);
    } catch (e) {
      return left(
        CustomError(
          ServerErrorHandler.handleError(
            e,
            'Error occurred while requesting OTP',
          ),
        ),
      );
    }
  }
}
