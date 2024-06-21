import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/exceptions.dart';
import 'package:forme_app/features/trainee_features/home/data/models/trainer_profile_model.dart';

abstract class HomeRepo {
  Future<Either<CustomError, List<TrainerProfile>>> getTopTrainers();
}
