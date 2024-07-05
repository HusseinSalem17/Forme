part of 'add_program_bloc.dart';

sealed class AddProgramState extends Equatable {
  const AddProgramState();
  
  @override
  List<Object> get props => [];
}

final class AddProgramInitial extends AddProgramState {}
