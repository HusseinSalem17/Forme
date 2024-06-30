part of 'work_out_bloc.dart';

sealed class TrainerWorkoutEvent {}

final class CoverPicked extends TrainerWorkoutEvent {
  final XFile image;

  CoverPicked(this.image);
}

final class UpdateTrainerWorkout extends TrainerWorkoutEvent {
  final WorkoutDataModel data;

  UpdateTrainerWorkout(this.data);
}
