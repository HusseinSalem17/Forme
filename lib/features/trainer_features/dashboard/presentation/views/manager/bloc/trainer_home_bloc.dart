import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'trainer_home_event.dart';
part 'trainer_home_state.dart';

class TrainerHomeBloc extends Bloc<TrainerHomeEvent, TrainerHomeState> {
  TrainerHomeBloc() : super(TrainerHomeInitial()) {
    on<TrainerHomeEvent>((event, emit) {});
  }
  int currentIndex = 0;
  void getCurrentIndex(int index) {
    emit(TrainerHomeBottomNavigation());
    currentIndex = index;
  }
}
