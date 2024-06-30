// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:forme_app/core/models/trainer/trainer_model.dart';
import 'package:forme_app/core/api/app_dio.dart';

part 'profile_state.dart';

class ProfileTrainerCubit extends Cubit<ProfileTrainerState> {
  AppDio api;
  ProfileTrainerCubit(
    this.api,
  ) : super(ProfileTrainerInitial());
  bool enableEditProfileScreen = false;
  // String name = "";
  // String? dateOfBirth;
  // String country = "";
  // String? phone;
  // String gender = "";
  // String sportField = "";
  // XFile? image;
  getTrainerProfileDetails() async {
    try {
      //emit(TrainerCompleteProfileLoading());
      final response = await api.get(
        '/trainings/trainer-detail/',
      );
      final trainerModel = TrainerModel.fromJson(response);
      debugPrint('${trainerModel.user?.username} ##############');
      //emit(TrainerCompleteProfileSuccess(message: 'success'));
    } catch (e) {
      //emit(TrainerCompleteProfileFailure(errMessage: 'failure'));
    }
  }
}
