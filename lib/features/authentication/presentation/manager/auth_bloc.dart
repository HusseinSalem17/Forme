import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/repos/auth_repo_implementation.dart';

import '../../../../local_storage_data/auth_local/registration_data_local.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepositoryImplementation authRepo = AuthRepositoryImplementation();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginEventCalled);
    on<SignUpEvent>(signupEventCalled);
    on<RequestOTPEvent>(requestOtpEventCalled);
  }

  FutureOr<void> requestOtpEventCalled(event, emit) async {
    emit(AuthLoading());
    try {
      print(event.email);
      print(event.userType);
      await authRepo.requestOTP(event.email, event.userType);

      // Save user type locally
      await RegistrationDataLocal.saveUserType(event.userType);
    } on Exception catch (e) {
      print(e.toString());
      emit(
        RequestOTPFailure(
          errMsg: 'An unexpected error occurred.',
        ),
      );
    }
  }

  FutureOr<void> signupEventCalled(event, emit) {
    if (event.isEmailValid() &&
        event.isPasswordValid() &&
        event.isPasswordsMatch()) {
      emit(AuthLoading());
      try {
        emit(SignUpSuccess());
      } catch (error) {
        emit(SignUpFailure(errMsg: 'An unexpected error occurred.'));
      }
    } else {
      if (!event.isEmailValid()) {
        emit(SignInFailure(errMsg: 'Please enter a valid email.'));
      } else if (!event.isPasswordValid()) {
        emit(SignInFailure(
            errMsg:
                'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.'));
      }
    }
  }

  FutureOr<void> loginEventCalled(event, emit) {
    if (event.isEmailValid() && event.isPasswordValid()) {
      emit(AuthLoading());
      try {
        // Perform any additional login logic here
        emit(SignInSuccess());
      } catch (error) {
        emit(SignInFailure(errMsg: 'An unexpected error occurred.'));
      }
    } else {
      if (!event.isEmailValid()) {
        emit(SignInFailure(errMsg: 'Please enter a valid email.'));
      } else if (!event.isPasswordValid()) {
        emit(SignInFailure(
            errMsg:
                'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.'));
      }
    }
  }
}
