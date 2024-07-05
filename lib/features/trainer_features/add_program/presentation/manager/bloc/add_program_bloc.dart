import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_program_event.dart';
part 'add_program_state.dart';

class AddProgramBloc extends Bloc<AddProgramEvent, AddProgramState> {
  AddProgramBloc() : super(AddProgramInitial()) {
    on<AddProgramEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
