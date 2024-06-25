import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/api/api_consumer.dart';
import 'package:forme_app/core/api/app_dio.dart';
import 'package:forme_app/core/models/trainer/user.dart';
import 'package:forme_app/core/utils/functions/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
part 'trainer_complete_profile_state.dart';

class TrainerCompleteProfileCubit extends Cubit<TrainerCompleteProfileState> {
  final AppDio api;
  XFile? image;
  String name = '';
  String? phone;
  String gender = '';
  String country = '';
  String sportField = '';
  String? birthDate;

  TrainerCompleteProfileCubit(this.api) : super(TrainerCompleteProfileState());

  void onNameChanged(String value) {
    name = value;
  }

  void onPhoneChanged(String value) {
    phone = value;
  }

  void onGenderChanged(String value) {
    gender = value;
  }

  void onCountryChanged(String value) {
    country = value;
  }

  void onSportFieldChanged(String value) {
    sportField = value;
  }

  void onBirthChanged(String value) {
    birthDate = value;
  }

  patchTrainerCompleteProfile() async {
    try {
      emit(TrainerCompleteProfileLoading());
      final response = await api.patch(
        '/auth/complete_profile_trainer/',
        data: {
          "user": {
            "username": name,
            if (birthDate != null)
              "date_of_birth": Utils().convertDateString(birthDate!),
            "country": country,
            if (phone != null) "phone_number": phone,
            if (image != null)
              "profile_picture": await Utils().convertXFileToBase64(image!),
            "gender": gender
          },
          "sport_field": sportField
        },
      );

      //final responseData = json.decode(response.data);
      //final user = User.fromJson(responseData['user']);

      //var trainerBox = Hive.box<User>('trainerData');
      //await trainerBox.put('trainer', user);
      emit(TrainerCompleteProfileSuccess(message: 'success'));
    } catch (e) {
      print(e);
      emit(TrainerCompleteProfileFailure(errMessage: 'failure'));
    }
  }

  postTrainerProfileImage(XFile image) async {
    try {
      emit(TrainerimageUploadLoading());
      await api.patch('/auth/update_profile_picture/',
          data: {"profile_picture": image}, isFromData: true);

      emit(TrainerimageUploadSuccess());
    } catch (e) {
      emit(TrainerimageUploadFailure());
    }
  }
}
