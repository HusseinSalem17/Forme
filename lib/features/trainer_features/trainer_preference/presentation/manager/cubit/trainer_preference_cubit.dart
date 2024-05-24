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
      emit(TrainerPreferenceLoading());
      await api.put('/auth/update_preference_trainer/',
          data: {
            if (bioController.text.isNotEmpty) 'bio': bioController.text,
            if (expInjuries.getOption() != 0)
              'exp_injuries': expInjuries.getOption() == 1 ? true : false,
            if (physicalDisabilities.getOption() != 0)
              'physical_disabilities':
                  physicalDisabilities.getOption() == 1 ? true : false,
            if (languages.isNotEmpty) 'languages': languages,
            if (idImage != null)
              'id_card':
                  "data:${idImage!.path.split('/').last};base64,${await Utils().convertXFileToBase64(idImage!)}",
            if (files.isNotEmpty)
              'documents': Utils().convertToMultiperFile(files),
            if (facebookUrl.text.isNotEmpty) 'facebook_url': facebookUrl.text,
            if (instagramUrl.text.isNotEmpty)
              'instagram_url': instagramUrl.text,
            if (youtubeUrl.text.isNotEmpty) 'youtube_url': youtubeUrl.text,
          },
          isFromData: files.isNotEmpty ? true : false);
      emit(TrainerPreferenceSuccess());
    } catch (e) {
      emit(TrainerPreferenceFailure(errorMessage: e.toString()));
      debugPrint('$e catch error when put trainer preferences data');
    }
  }
}
