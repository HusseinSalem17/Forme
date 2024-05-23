import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/repos/auth_repo_implementation.dart';
import '../../../../local_storage_data/auth_local/tokens.dart';
import '../../../../local_storage_data/auth_local/user_type.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepositoryImplementation authRepo = AuthRepositoryImplementation();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginEventCalled);
    on<SignUpEvent>(signupEventCalled);
    on<RequestOTPEvent>(requestOtpEventCalled);
    on<VerifyOTPEvent>(verifyOTPEventCalled);
  }

  Future<void> verifyOTPEventCalled(
    VerifyOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.verifyOTP(event.email, event.otp);
    result.fold(
      (error) {
        emit(VerifyOTPFailure(errMsg: error.message));
      },
      (success) {
        print('VerifyOTPSuccess emitted');
        emit(VerifyOTPSuccess());
      },
    );
  }

  Future<void> requestOtpEventCalled(
      RequestOTPEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await authRepo.requestOTP(event.email, event.userType);
    await result.fold(
      (error) async {
        emit(RequestOTPFailure(errMsg: error.message));
      },
      (success) async {
        // Save user type locally
        await RegistrationDataLocal.saveUserType(
          event.userType,
        );
        emit(RequestOTPSuccess(
          email: event.email,
          password: event.password,
          userType: event.userType,
        ));
      },
    );
  }

  Future<void> signupEventCalled(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    print('SignUpEvent called');
    final result = await authRepo.signUpAccount(
      event.email!,
      event.password1!,
      event.userType!,
    );
    await result.fold(
      (error) async {
        emit(SignUpFailure(errMsg: error.message));
      },
      (success) async {
        print('SignUpSuccess emitted');
        await UserTokenLocal.saveTokens(
          success.access,
          success.refresh,
        );
        emit(SignUpSuccess());
      },
    );
  }

  Future<void> loginEventCalled(
      LoginEvent event, Emitter<AuthState> emit) async {
    if (event.isEmailValid() && event.isPasswordValid()) {
      emit(AuthLoading());
      try {
        // Perform any additional login logic here if needed
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
              'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.',
        ));
      }
    }
  }
}
