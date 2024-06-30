part of 'special_programs_bloc.dart';

@immutable
sealed class SpecialProgramsEvent {}

final class GetSpecialPrograms extends SpecialProgramsEvent {}