import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/failures.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/data/models/trainer_complete_profile_data.dart';


abstract class TrainerCompleteProfileRepo {
  Either<Failure, String> handleTrainerCompleteProfile({
    required TrainerCompleteProfileData data,
  });
}
