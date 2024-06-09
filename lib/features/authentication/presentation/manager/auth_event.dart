part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final UserType userType;

  LoginEvent({
    required this.email,
    required this.password,
    required this.userType,
  });

  bool isEmailValid() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isPasswordValid() {
    return password.length >= 8 &&
        RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password);
  }
}

final class SignUpEvent extends AuthEvent {
  final String? email;
  final String? password1;
  final String? password2;
  final UserType? userType;

  SignUpEvent({
    this.email,
    this.password1,
    this.password2,
    this.userType,
  });

  bool isEmailValid() {
    if (email == null) return false;
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email!);
  }

  bool isPasswordValid() {
    if (password1 == null) return false;
    return password1!.length >= 8 &&
        RegExp(
          r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
        ).hasMatch(password1!);
  }

  bool isPasswordsMatch() {
    return password1 == password2;
  }
}

final class RequestOTPForSignUpEvent extends AuthEvent {
  final String email;
  final UserType userType;
  final String password;

  RequestOTPForSignUpEvent({
    required this.email,
    required this.userType,
    required this.password,
  });
}

final class VerifyOTPForSignUpEvent extends AuthEvent {
  final String otp;
  final String email;
  VerifyOTPForSignUpEvent({
    required this.otp,
    required this.email,
  });
}

final class RequestOTPForForgetPasswordEvent extends AuthEvent {
  final String email;
  RequestOTPForForgetPasswordEvent({
    required this.email,
  });
}

final class VerifyOTPForForgetPasswordEvent extends AuthEvent {
  final String otp;
  final String email;
  VerifyOTPForForgetPasswordEvent({
    required this.otp,
    required this.email,
  });
}

final class SetNewPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  SetNewPasswordEvent({
    required this.email,
    required this.password,
  });
}

class VerifyOTPEvent extends AuthEvent {
final String otp;
final String email;
final bool isSignUp;

VerifyOTPEvent({
required this.otp,
required this.email,
required this.isSignUp,
});
}
