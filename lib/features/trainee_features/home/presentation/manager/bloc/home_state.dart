part of 'home_bloc.dart';

@immutable
abstract class TraineeHomeState {}

class HomeInitial extends TraineeHomeState {}

final class HomeBottomNavigation extends TraineeHomeState {
  final int currentIndex;

  HomeBottomNavigation(this.currentIndex);
}

final class GetTopTrainersLoading extends TraineeHomeState {}

final class GetTopTrainersSuccess extends TraineeHomeState {
  final List<TrainerProfile> trainerProfileData;

  GetTopTrainersSuccess({
    required this.trainerProfileData,
  });
}
final class GetTopTrainersFailure extends TraineeHomeState {
  final String errorMsg;

  GetTopTrainersFailure(this.errorMsg);
}


//
// final class GetSpecialProgramsLoading extends TraineeHomeState {}
//
// final class GetSpecialProgramsSuccess extends TraineeHomeState {
//   final List<TrainerProfileProgram> trainerProfileProgramData;
//
//   GetSpecialProgramsSuccess({
//     required this.trainerProfileProgramData,
//   });
// }
//
// final class GetSpecialProgramsFailure extends TraineeHomeState {
//   final String errorMsg;
//
//   GetSpecialProgramsFailure(this.errorMsg);
// }