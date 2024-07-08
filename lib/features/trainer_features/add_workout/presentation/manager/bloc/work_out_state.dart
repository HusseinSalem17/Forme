part of 'work_out_bloc.dart';

sealed class WorkOutState {
  const WorkOutState();
}

final class WorkOutInitial extends WorkOutState {}

final class AddWorkOutLoading extends WorkOutState {
  final XFile? image;

  AddWorkOutLoading({this.image});
}

final class AddWorkOutSuccess extends WorkOutState {}

final class AddWorkOutFailure extends WorkOutState {
  final String errorMessage;

  AddWorkOutFailure({required this.errorMessage});
}

final class AddWorkOutCoverSuccess extends WorkOutState {
  final XFile image;
  final String imageBase64;

  AddWorkOutCoverSuccess(this.image, this.imageBase64);
}
