part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class UpdateCurrentIndexEvent extends HomeEvent {
  final int index;
  UpdateCurrentIndexEvent(this.index);
}