import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainee_features/home/data/models/trainer_profile_model.dart';
import 'package:meta/meta.dart';
import '../../../data/models/trainer_profile_program_model.dart';
import '../../../data/repos/home_repo.dart';

part 'home_event.dart';

part 'home_state.dart';

class TraineeHomeBloc extends Bloc<HomeEvent, TraineeHomeState> {
  int currentIndex = 0;
  final HomeRepo homeRepo;

  TraineeHomeBloc({required this.homeRepo}) : super(HomeInitial()) {
    on<HomeBottomNav>(homeBottomNavEventCalled);
    on<GetTopTrainers>(getTopTrainerCalled);
    // on<GetSpecialPrograms>((event, emit) async {
    //   emit(GetSpecialProgramsLoading());
    //   final result = await homeRepo.getSpecialPrograms();
    //   result.fold(
    //     (error) => emit(
    //       GetSpecialProgramsFailure(error.message),
    //     ),
    //     (programs) => emit(
    //       GetSpecialProgramsSuccess(trainerProfileProgramData: programs),
    //     ),
    //   );
    // });
  }

  FutureOr<void> homeBottomNavEventCalled(event, emit) {
    currentIndex = event.index;
    emit(HomeBottomNavigation(currentIndex));
  }

  void getTopTrainerCalled(
    GetTopTrainers event,
    Emitter<TraineeHomeState> emit,
  ) async {
    emit(GetTopTrainersLoading());
    final result = await homeRepo.getTopTrainers();

    result.fold(
      (error) => emit(
        GetTopTrainersFailure(error.message),
      ),
      (trainers) => emit(
        GetTopTrainersSuccess(trainerProfileData: trainers),
      ),
    );
  }
}
