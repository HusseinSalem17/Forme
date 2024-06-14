part of 'trainee_complete_profile_bloc.dart';

@immutable
sealed class TraineeCompleteProfileEvent {}

final class ImagePicked extends TraineeCompleteProfileEvent {
  final XFile image;

  ImagePicked(this.image);
}

final class UpdateTraineeProfile extends TraineeCompleteProfileEvent {
  final TraineeCompleteProfileDataModel data;

  UpdateTraineeProfile(this.data);
}
