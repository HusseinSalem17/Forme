part of 'add_program_bloc.dart';

sealed class AddProgramState {
  const AddProgramState();
}

final class ProgramInitial extends AddProgramState {}

final class AddProgramLoading extends AddProgramState {
  final XFile? image;

  AddProgramLoading({this.image});
}

final class AddProgramSuccess extends AddProgramState {}

final class AddProgramFailure extends AddProgramState {
  final String errorMessage;
  AddProgramFailure({required this.errorMessage});
}

final class AddProgramCoverSuccess extends AddProgramState {
  final XFile image;
  final String imageBase64;

  AddProgramCoverSuccess(this.image, this.imageBase64);
}

final class AddProgramPlansSuccess extends AddProgramState {
  final ProgramPlansModel plans;

  AddProgramPlansSuccess(this.plans);
}
