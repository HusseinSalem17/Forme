import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/exceptions.dart';

import '../models/trainee_complete_profile_data_model.dart';
import '../models/complete_profile_response.dart';

abstract class TraineeCompleteProfileRepo {
  Future<Either<CustomError, CompleteProfileResponse>>
      updateTraineeCompleteProfile({
    required TraineeCompleteProfileDataModel data,
  });
}
