part of 'complete_profile_cubit.dart';

sealed class CompleteProfileState extends Equatable {
  const CompleteProfileState();

  @override
  List<Object> get props => [];
}

final class CompleteProfileInitial extends CompleteProfileState {}

final class CompleteProfileLoading extends CompleteProfileState {}

final class CompleteProfileFailure extends CompleteProfileState {
  final String errMessage;

  const CompleteProfileFailure({required this.errMessage});
}

final class CompleteProfileSuccess extends CompleteProfileState {
  final String message;

  const CompleteProfileSuccess({required this.message});
}
