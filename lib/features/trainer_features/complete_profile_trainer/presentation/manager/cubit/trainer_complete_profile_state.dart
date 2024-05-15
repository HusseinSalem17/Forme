part of 'trainer_complete_profile_cubit.dart';

class TrainerCompleteProfileState {}

final class TrainerCompleteProfileInitial extends TrainerCompleteProfileState {}

final class TrainerCompleteProfileLoading extends TrainerCompleteProfileState {}

final class TrainerCompleteProfileFailure extends TrainerCompleteProfileState {
  final String errMessage;

  TrainerCompleteProfileFailure({required this.errMessage});
}

final class TrainerCompleteProfileSuccess extends TrainerCompleteProfileState {
  final String message;
  TrainerCompleteProfileSuccess({required this.message});
}
