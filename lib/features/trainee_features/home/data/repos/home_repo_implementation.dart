import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/exceptions.dart';
import 'package:forme_app/features/trainee_features/home/data/models/trainer_profile_model.dart';
import 'package:forme_app/features/trainee_features/home/data/repos/home_repo.dart';
import 'package:forme_app/features/trainee_features/home/data/web_services/home_services.dart';

import '../../../../../core/errors/server_errors.dart';
import '../models/trainer_profile_program_model.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeServices homeServices;

  HomeRepoImplementation({required this.homeServices});

  @override
  Future<Either<CustomError, List<TrainerProfile>>> getTopTrainers() async {
    try {
      final response = await homeServices.getTopTrainers();
      return right(response);
    } catch (e) {
      return left(
        CustomError(
          ServerErrorHandler.handleError(
            e,
            'Error occurred while get top trainers data',
          ),
        ),
      );
    }
  }

  @override
  Future<Either<CustomError, List<TrainerProfileProgram>>>
      getSpecialPrograms() async {
    try {
      final response = await homeServices.getSpecialPrograms();
      return right(response);
    } catch (e) {
      return left(
        CustomError(
          ServerErrorHandler.handleError(
            e,
            'Error occurred while get top special programs',
          ),
        ),
      );
    }
  }
}
