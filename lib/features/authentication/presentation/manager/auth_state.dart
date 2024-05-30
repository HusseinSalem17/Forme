part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

/// login states
final class SignInSuccess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errMsg;

  SignInFailure({
    required this.errMsg,
  });
}

/// signup states
final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMsg;

  SignUpFailure({
    required this.errMsg,
  });
}

/// request otp states for SignUp
final class RequestOTPSuccessSignUp extends AuthState {
  final String email;
  final String password;
  final UserType? userType;

  RequestOTPSuccessSignUp({
    required this.email,
    required this.password,
    this.userType,
  });
}

final class RequestOTPFailureSignUp extends AuthState {
  final String errMsg;

  RequestOTPFailureSignUp({
    required this.errMsg,
  });
}

/// verify otp states
final class VerifyOTPSuccessSignUp extends AuthState {}

final class VerifyOTPFailureSignUp extends AuthState {
  final String errMsg;
  VerifyOTPFailureSignUp({
    required this.errMsg,
  });
}

final class RequestOTPSuccessForForgetPassword extends AuthState {
  final String email;
  RequestOTPSuccessForForgetPassword({required this.email});
}

final class RequestOTPFailureForgetPassword extends AuthState {
  final String errMsg;
  RequestOTPFailureForgetPassword({required this.errMsg});
}


final class VerifyOTPForgetPasswordSuccess extends AuthState {
  final String email;
  VerifyOTPForgetPasswordSuccess({required this.email});
}

final class SetNewPasswordSuccess extends AuthState {}

final class SetNewPasswordFailure extends AuthState {
  final String errMsg;
  SetNewPasswordFailure({
    required this.errMsg,
  });
}
class VerifyOTPSuccess extends AuthState {
final String email;
final bool isSignUp;

VerifyOTPSuccess({
required this.email,
required this.isSignUp,
});
}