part of 'work_out_bloc.dart';

sealed class WorkOutState {
  const WorkOutState();
}

final class WorkOutInitial extends WorkOutState {}

final class WorkOutLoading extends WorkOutState {
  final XFile? image;

  WorkOutLoading({this.image});
}

final class WorkOutCoverSuccess extends WorkOutState {
  final XFile image;
  final String imageBase64;

  WorkOutCoverSuccess(this.image, this.imageBase64);
}

final class WorkOutSuccess extends WorkOutState {}

final class WorkOutFailure extends WorkOutState {
  final String errorMessage;

  WorkOutFailure({required this.errorMessage});
}
