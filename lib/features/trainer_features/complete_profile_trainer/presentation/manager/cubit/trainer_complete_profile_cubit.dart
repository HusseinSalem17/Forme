import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/api/api_consumer.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/data/models/trainer_complete_profile_model.dart';

part 'trainer_complete_profile_state.dart';

class TrainerCompleteProfileCubit extends Cubit<TrainerCompleteProfileState> {
  final ApiConsumer api;

  TrainerCompleteProfileCubit(this.api) : super(TrainerCompleteProfileState());

  String name = "";
  String dateOfBirth = "";
  String country = "";
  String phone = "";
  String gender = "";
  String sportField = "";

  postTrainerCopleteProfile() async {
    try {
      emit(TrainerCompleteProfileLoading());
      final response =
          await api.patch('/auth/complete_profile_trainer/', data: {
        "user": {
          "username": name,
          "date_of_birth": dateOfBirth,
          "country": country,
          "phone_number": phone,
          "gender": gender
        },
        "sport_field": sportField
      });
      //final trainerModel = TrainerCompleteProfileModel.fromJson(response);

      emit(TrainerCompleteProfileSuccess(message: 'success'));
    } catch (e) {
      emit(TrainerCompleteProfileFailure(errMessage: 'failure'));
    }
  }
}
