part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInFailure extends AuthState {
  final String errMsg;

  SignInFailure({required this.errMsg});
}

class SignUpSuccess extends AuthState {}

class SignUpFailure extends AuthState {
  final String errMsg;

  SignUpFailure({required this.errMsg});
}

class RequestOTPSuccess extends AuthState {}

class RequestOTPFailure extends AuthState {
  final String errMsg;

  RequestOTPFailure({required this.errMsg});
}
