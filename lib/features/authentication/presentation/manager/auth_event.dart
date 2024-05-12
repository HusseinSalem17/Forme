part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
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

class SignUpEvent extends AuthEvent {
  final String? email;
  final String? password1;
  final String? password2;

  SignUpEvent({
    this.email,
    this.password1,
    this.password2,
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

class RequestOTPEvent extends AuthEvent {
  final String email;
  final UserType userType;

  RequestOTPEvent({
    required this.email,
    required this.userType,
  });
}
