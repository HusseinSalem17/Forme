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
    on<SignUpEvent>(signUpEventCalled);
    on<RequestOTPForSignUpEvent>(requestOtpForSignUpEventCalled);
    on<RequestOTPForForgetPasswordEvent>(
        requestOtpForForgetPasswordEventCalled);
    on<SetNewPasswordEvent>(setNewPasswordEventCalled);
    on<VerifyOTPEvent>(onVerifyOTPEvent);
  }

  Future<void> onVerifyOTPEvent(
    VerifyOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await authRepo.verifyOTP(event.email, event.otp);

    result.fold(
      (error) => emit(
        VerifyOTPFailureSignUp(
          errMsg: error.message,
        ),
      ),
      (success) => emit(
        VerifyOTPSuccess(
          email: event.email,
          isSignUp: event.isSignUp,
        ),
      ),
    );
  }

  FutureOr<void> setNewPasswordEventCalled(
    event,
    emit,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.setNewPassword(event.email, event.password);
    result.fold(
      (error) {
        print('error here ');
        emit(
          SetNewPasswordFailure(
            errMsg: error.message,
          ),
        );
      },
      (success) {
        print('VerifyOTPSuccess emitted');
        emit(SetNewPasswordSuccess());
      },
    );
  }

  FutureOr<void> requestOtpForForgetPasswordEventCalled(
    RequestOTPForForgetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    print(event.email);
    final result = await authRepo.requestOTPForForgetPassword(event.email);
    result.fold((error) {
      print('i have error');
      emit(
        RequestOTPFailureSignUp(
          errMsg: error.message,
        ),
      );
    }, (success) {
      print(' request otp for new password is success');
      emit(
        RequestOTPSuccessForForgetPassword(
          email: event.email,
        ),
      );
    });
  }

  Future<void> requestOtpForSignUpEventCalled(
    RequestOTPForSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.requestOTPForSignUp(
      event.email,
      event.userType,
    );
    await result.fold(
      (error) async {
        emit(
          RequestOTPFailureSignUp(
            errMsg: error.message,
          ),
        );
      },
      (success) async {
        emit(RequestOTPSuccessSignUp(
          email: event.email,
          password: event.password,
          userType: event.userType,
        ));
      },
    );
  }

  Future<void> signUpEventCalled(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    print('SignUpEvent called');
    final result = await authRepo.signUpAccount(
      event.email!,
      event.password1!,
      event.userType!,
    );
    await result.fold(
      (error) async {
        emit(
          SignUpFailure(
            errMsg: error.message,
          ),
        );
      },
      (success) async {
        print('SignUpSuccess emitted');
        await UserTokenLocal.saveTokens(
          success.access,
          success.refresh,
        );
        await RegistrationDataLocal.saveUserType(
          event.userType!,
        );
        emit(SignUpSuccess());
      },
    );
  }

  Future<void> loginEventCalled(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await authRepo.loginAccount(
      event.email,
      event.password,
      event.userType,
    );
    await result.fold(
      (error) async {
        emit(
          SignInFailure(
            errMsg: error.message,
          ),
        );
      },
      (success) async {
        print('SignInSuccess emitted');
        await UserTokenLocal.saveTokens(
          success.access,
          success.refresh,
        );
        await RegistrationDataLocal.saveUserType(
          event.userType,
        );
        print('i am saving data ');
        emit(SignInSuccess());
      },
    );
  }
}
