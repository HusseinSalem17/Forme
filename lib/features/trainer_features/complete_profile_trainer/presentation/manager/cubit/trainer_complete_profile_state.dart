part of 'trainer_complete_profile_cubit.dart';

sealed class TrainerCompleteProfileState extends Equatable {
  const TrainerCompleteProfileState();

  @override
  List<Object> get props => [];
}

final class TrainerCompleteProfileInitial extends TrainerCompleteProfileState {}

final class TrainerCompleteProfileLoading extends TrainerCompleteProfileState {}

final class TrainerCompleteProfileFailure extends TrainerCompleteProfileState {
  final String errMessage;

  const TrainerCompleteProfileFailure({required this.errMessage});
}

final class TrainerCompleteProfileSuccess extends TrainerCompleteProfileState {
  final String message;

  const TrainerCompleteProfileSuccess({required this.message});
}
