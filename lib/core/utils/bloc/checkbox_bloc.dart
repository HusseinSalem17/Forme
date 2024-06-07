import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkbox_event.dart';
part 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(CheckboxUncheckedState()) {
    on<ToggleCheckboxEvent>((event, emit) {
      if (state is CheckboxUncheckedState) {
        emit(CheckboxCheckedState());
      } else {
        emit(CheckboxUncheckedState());
      }
    });
  }
}