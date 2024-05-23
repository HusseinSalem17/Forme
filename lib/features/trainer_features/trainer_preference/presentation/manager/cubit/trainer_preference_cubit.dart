import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:forme_app/core/api/api_consumer.dart';
import 'package:forme_app/core/utils/functions/utils.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/two_choices.dart';
import 'package:image_picker/image_picker.dart';

part 'trainer_preference_state.dart';

class TrainerPreferenceCubit extends Cubit<TrainerPreferenceState> {
  final ApiConsumer api;
  TrainerPreferenceCubit(this.api) : super(TrainerPreferenceInitial());

  TextEditingController bioController = TextEditingController();
  TwoChoicesController expInjuries = TwoChoicesController();
  TwoChoicesController physicalDisabilities = TwoChoicesController();
  TextEditingController facebookUrl = TextEditingController();
  TextEditingController instagramUrl = TextEditingController();
  TextEditingController youtubeUrl = TextEditingController();
  int page = 0;
  List<String> languages = [];
  XFile? idImage;
  List<File> files = [];

  putTrainerPreference() async {
    try {
      emit(TrainerPreferenceState());
      await api.put(
        '/auth/update_preference_trainer/',
        data: {
          "bio": bioController.text,
          "exp_injuries": expInjuries.getOption() == 1
              ? true
              : (expInjuries.getOption() == 2 ? false : null),
          "physical_disabilities": physicalDisabilities.getOption() == 1
              ? true
              : (physicalDisabilities.getOption() == 2 ? false : null),
          "languages": languages,
          "id_card":
              "data:${idImage!.path.split('/').last};base64,${await Utils().convertXFileToBase64(idImage!)}",
          "facebook_url": "https://www.facebook.com/",
          "instagram_url": "https://www.facebook.com/",
          "youtube_url": "https://www.facebook.com/"
        },
      );
    } catch (e) {
      debugPrint('$e catch error when put trainer preferences data');
    }
  }

  putTrainerPreferenceDocuments() async {
    try {
      emit(TrainerPreferenceState());
      await api.put('/auth/update_preference_trainer/',
          data: {
            "documents": Utils().convertToMultiperFile(files),
          },
          isFromData: true);
    } catch (e) {
      debugPrint('$e catch error when put trainer preferences documents');
    }
  }
}
