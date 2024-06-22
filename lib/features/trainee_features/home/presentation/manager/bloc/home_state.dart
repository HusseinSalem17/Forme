part of 'home_bloc.dart';

@immutable
abstract class TraineeHomeState {}

class HomeInitial extends TraineeHomeState {}

final class HomeBottomNavigation extends TraineeHomeState {
  final int currentIndex;

  HomeBottomNavigation(this.currentIndex);
}

final class TopTrainersSuccess extends TraineeHomeState {
  final List<TrainerProfile> trainerProfileData;

  TopTrainersSuccess({
    required this.trainerProfileData,
  });
}

class HomeLoading extends TraineeHomeState {}

class HomeFailure extends TraineeHomeState {
  final String errorMsg;

  HomeFailure(this.errorMsg);
}
