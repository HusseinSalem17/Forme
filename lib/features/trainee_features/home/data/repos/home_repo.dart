import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/exceptions.dart';
import 'package:forme_app/features/trainee_features/home/data/models/trainer_profile_model.dart';

import '../models/trainer_profile_program_model.dart';

abstract class HomeRepo {
  Future<Either<CustomError, List<TrainerProfile>>> getTopTrainers();
  Future<Either<CustomError, List<TrainerProfileProgram>>> getSpecialPrograms();
}
