part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

final class HomeBottomNavigation extends HomeState {
  final int currentIndex;

  HomeBottomNavigation(this.currentIndex);
}

final class TopTrainersSuccess extends HomeState {
  final List<TrainerProfile> trainerProfileData;

  TopTrainersSuccess({
    required this.trainerProfileData,
  });
}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String errorMsg;

  HomeFailure(this.errorMsg);
}
