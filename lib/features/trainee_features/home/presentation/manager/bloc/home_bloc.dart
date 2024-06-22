import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainee_features/home/data/models/trainer_profile_model.dart';

import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:forme_app/core/errors/exceptions.dart';

import '../../../data/repos/home_repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class TraineeHomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  final HomeRepo homeRepo;

  TraineeHomeBloc({required this.homeRepo}) : super(HomeInitial()) {
    on<HomeBottomNavEvent>((event, emit) {
      currentIndex = event.index;
      emit(HomeBottomNavigation(currentIndex));
    });

    on<GetTopTrainers>(_onFetchTopTrainers);
  }

  void _onFetchTopTrainers(
      GetTopTrainers event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    Either<CustomError, List<TrainerProfile>> result =
        await homeRepo.getTopTrainers();

    result.fold(
      (error) => emit(HomeFailure(error.message)),
      (trainers) => emit(TopTrainersSuccess( trainerProfileData: trainers)),
    );
  }
}
