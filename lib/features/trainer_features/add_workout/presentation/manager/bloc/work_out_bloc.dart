
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:forme_app/core/utils/functions/convert_to_base_64.dart';
import 'package:forme_app/features/trainer_features/add_workout/data/models/workout_details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:forme_app/core/api/app_dio.dart';

part 'work_out_event.dart';
part 'work_out_state.dart';

class WorkOutBloc extends Bloc<TrainerWorkoutEvent, WorkOutState> {
  AppDio api;
  WorkOutBloc(
    this.api,
  ) : super(WorkOutInitial()) {
    on<CoverPicked>(_coverPickedEventCalled);
    on<UpdateTrainerWorkout>(_updateTrainerWorkout);
  }

  FutureOr<void> _updateTrainerWorkout(
      UpdateTrainerWorkout event, Emitter<WorkOutState> emit) async {
    try {
      emit(AddWorkOutLoading());
      //print(event.data.toJson());
      await api.post('/trainings/workout-add/', data: event.data);
      emit(AddWorkOutSuccess());
    } catch (e) {
      emit(AddWorkOutFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _coverPickedEventCalled(
      CoverPicked event, Emitter<WorkOutState> emit) async {
    emit(AddWorkOutLoading(image: event.image));
    try {
      final String imageBase64 = await convertXFileToBase64(event.image);
      emit(AddWorkOutCoverSuccess(event.image, imageBase64));
    } catch (error) {
      emit(AddWorkOutFailure(errorMessage: error.toString()));
    }
  }
}
