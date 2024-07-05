part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int currentIndex;
  const HomeState(this.currentIndex);
}

class HomeInitial extends HomeState {
  const HomeInitial() : super(0); // Default index is 0
}

class HomeBottomNavigation extends HomeState {
  const HomeBottomNavigation(int currentIndex) : super(currentIndex);
}
