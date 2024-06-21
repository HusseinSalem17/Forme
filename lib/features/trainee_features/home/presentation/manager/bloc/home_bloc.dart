import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class TraineeHomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;

  TraineeHomeBloc() : super(HomeInitial()) {
    on<HomeBottomNavEvent>((event, emit) {
      currentIndex = event.index;
      emit(HomeBottomNavigation(currentIndex));
    });
  }
}
