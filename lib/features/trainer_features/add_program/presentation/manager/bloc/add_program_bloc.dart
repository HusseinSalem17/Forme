// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:forme_app/core/api/app_dio.dart';
import 'package:forme_app/core/utils/functions/convert_to_base_64.dart';
import 'package:forme_app/features/trainer_features/add_program/data/models/program_details.dart';
import 'package:forme_app/features/trainer_features/add_program/data/models/program_plans.dart';
import 'package:image_picker/image_picker.dart';

part 'add_program_event.dart';
part 'add_program_state.dart';

class AddProgramBloc extends Bloc<AddProgramEvent, AddProgramState> {
  AppDio api;

  AddProgramBloc(
    this.api,
  ) : super(ProgramInitial()) {
    on<CoverPicked>(_uploadProgramCover);
    on<UploadProgramPlans>(_uploadProgramPlans);
    on<UpdateTrainerProgram>(_updateTrainerProgram);
  }

  FutureOr<void> _uploadProgramCover(
      CoverPicked event, Emitter<AddProgramState> emit) async {
    try {
      emit(AddProgramLoading(image: event.image));
      final imageBase64 = await convertXFileToBase64(event.image);
      emit(AddProgramCoverSuccess(event.image, imageBase64));
    } catch (error) {
      emit(AddProgramFailure(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _uploadProgramPlans(
      UploadProgramPlans event, Emitter<AddProgramState> emit) async {
    try {
      emit(AddProgramLoading());
      final ProgramPlansModel programPlans = event.plans;
      emit(AddProgramPlansSuccess(programPlans));
    } catch (e) {
      emit(AddProgramFailure(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _updateTrainerProgram(
      UpdateTrainerProgram event, Emitter<AddProgramState> emit) async {
    try {
      emit(AddProgramLoading());
      await api.post('/trainings/program-add/', data: event.data);
      emit(AddProgramSuccess());
    } catch (e) {
      emit(AddProgramFailure(errorMessage: e.toString()));
    }
  }
}
