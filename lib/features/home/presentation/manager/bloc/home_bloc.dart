import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int currentIndex = 0;
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }
  void getCurrentIndex(int index) {
    emit(HomeBottomNavigation());
    currentIndex = index;
  }
}
