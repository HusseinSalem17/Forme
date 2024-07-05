import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<UpdateCurrentIndexEvent>((event, emit) {
      emit(HomeBottomNavigation(event.index));
    });
  }

  int get currentIndex => state.currentIndex;

  void getCurrentIndex(int index) {
    add(UpdateCurrentIndexEvent(index));
  }
}