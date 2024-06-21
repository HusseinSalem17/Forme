part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeBottomNavigation extends HomeState {
  final int currentIndex;
  HomeBottomNavigation(this.currentIndex);
}
