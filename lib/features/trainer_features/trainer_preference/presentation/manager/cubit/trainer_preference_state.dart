part of 'trainer_preference_cubit.dart';

class TrainerPreferenceState {
  int page;

  TrainerPreferenceState({this.page = 0});
}

final class TrainerPreferenceInitial extends TrainerPreferenceState {}

final class TrainerPreferenceLoading extends TrainerPreferenceState {}

final class TrainerPreferenceSuccess extends TrainerPreferenceState {}

final class TrainerPreferenceFailure extends TrainerPreferenceState {
  final String errorMessage;

  TrainerPreferenceFailure({super.page, required this.errorMessage});
}
