part of 'add_program_bloc.dart';

sealed class AddProgramEvent {}

final class CoverPicked extends AddProgramEvent {
  final XFile image;

  CoverPicked(this.image);
}

final class UploadProgramPlans extends AddProgramEvent {
  final ProgramPlansModel plans;

  UploadProgramPlans(this.plans);
}

final class UpdateTrainerProgram extends AddProgramEvent {
  final ProgramDataModel data;

  UpdateTrainerProgram(this.data);
}
