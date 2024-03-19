part of 'trainer_home_bloc.dart';

@immutable
sealed class TrainerHomeState{}

final class TrainerHomeInitial extends TrainerHomeState {}

class TrainerHomeBottomNavigation extends TrainerHomeState {}
