part of 'trainee_complete_profile_bloc.dart';

@immutable
sealed class TraineeCompleteProfileState {}

final class TraineeCompleteProfileInitial extends TraineeCompleteProfileState {}

final class TraineeCompleteProfileLoading extends TraineeCompleteProfileState {
  final XFile? image;

  TraineeCompleteProfileLoading({this.image});
}

final class ImagePickedSuccess extends TraineeCompleteProfileState {
  final XFile image;

  ImagePickedSuccess(this.image);
}

final class TraineeCompleteProfileSuccess extends TraineeCompleteProfileState {}

final class TraineeCompleteProfileFailure extends TraineeCompleteProfileState {
  final String errorMsg;

  TraineeCompleteProfileFailure({
    required this.errorMsg,
  });
}
