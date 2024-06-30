part of 'special_programs_bloc.dart';

@immutable
sealed class SpecialProgramsState {}

final class SpecialProgramsInitial extends SpecialProgramsState {}

final class GetSpecialProgramsLoading extends SpecialProgramsState {}

final class GetSpecialProgramsSuccess extends SpecialProgramsState {
  final List<TrainerProfileProgram> trainerProfileProgramData;

  GetSpecialProgramsSuccess({
    required this.trainerProfileProgramData,
  });
}

final class GetSpecialProgramsFailure extends SpecialProgramsState {
  final String errorMsg;

  GetSpecialProgramsFailure(this.errorMsg);
}
