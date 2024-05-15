part of 'trainer_complete_profile_cubit.dart';

class TraineeCompleteProfileState {}

final class TraineeCompleteProfileInitial extends TraineeCompleteProfileState {}

final class TraineeCompleteProfileLoading extends TraineeCompleteProfileState {}

final class TraineeCompleteProfileFailure extends TraineeCompleteProfileState {
  final String errMessage;

  TraineeCompleteProfileFailure({required this.errMessage});
}

final class TraineeCompleteProfileSuccess extends TraineeCompleteProfileState {
  final String message;

  TraineeCompleteProfileSuccess({required this.message});
}
