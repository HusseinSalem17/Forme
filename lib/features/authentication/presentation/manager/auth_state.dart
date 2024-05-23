part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

/// login states
final class SignInSuccess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errMsg;

  SignInFailure({required this.errMsg});
}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMsg;

  SignUpFailure({required this.errMsg});
}

/// request otp states
final class RequestOTPSuccess extends AuthState {
  final String email;
  final String password;
  final UserType userType;

  RequestOTPSuccess({
    required this.email,
    required this.password,
    required this.userType,
  });
}

final class RequestOTPFailure extends AuthState {
  final String errMsg;

  RequestOTPFailure({
    required this.errMsg,
  });
}

/// verify otp states
final class VerifyOTPSuccess extends AuthState {}

final class VerifyOTPFailure extends AuthState {
  final String errMsg;
  VerifyOTPFailure({
    required this.errMsg,
  });
}
