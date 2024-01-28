part of 'trainer_home_bloc.dart';

sealed class TrainerHomeState extends Equatable {
  const TrainerHomeState();

  @override
  List<Object> get props => [];
}

final class TrainerHomeInitial extends TrainerHomeState {}

class TrainerHomeBottomNavigation extends TrainerHomeState {}
