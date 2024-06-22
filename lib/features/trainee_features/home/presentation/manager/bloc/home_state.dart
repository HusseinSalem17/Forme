part of 'home_bloc.dart';

@immutable
abstract class TraineeHomeState {}

class HomeInitial extends TraineeHomeState {}

final class HomeBottomNavigation extends TraineeHomeState {
  final int currentIndex;

  HomeBottomNavigation(this.currentIndex);
}

final class GetTopTrainersSuccess extends TraineeHomeState {
  final List<TrainerProfile> trainerProfileData;

  GetTopTrainersSuccess({
    required this.trainerProfileData,
  });
}

final class GetSpecialProgramsSuccess extends TraineeHomeState {
  final List<TrainerProfileProgram> trainerProfileProgramData;

  GetSpecialProgramsSuccess({
    required this.trainerProfileProgramData,
  });
}

final class HomeLoading extends TraineeHomeState {}

final class HomeFailure extends TraineeHomeState {
  final String errorMsg;

  HomeFailure(this.errorMsg);
}
