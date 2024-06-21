part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeBottomNavEvent extends HomeEvent {
  final int index;
  HomeBottomNavEvent(this.index);
}
