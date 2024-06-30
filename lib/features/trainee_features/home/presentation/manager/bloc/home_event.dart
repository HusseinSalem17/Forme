part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeBottomNav extends HomeEvent {
  final int index;

  HomeBottomNav(this.index);
}

final class GetTopTrainers extends HomeEvent {}

// final class GetSpecialPrograms extends HomeEvent {}
