import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/exceptions.dart';

import '../models/profile_data_model.dart';
import '../models/profile_data_uploaded_successful_model.dart';

abstract class TraineeCompleteProfileRepo {
  Future<Either<CustomError, ProfileDataUploadedSuccessfulModel>> updateTraineeCompleteProfile({
    required TraineeCompleteProfileDataModel data,
  });
}
