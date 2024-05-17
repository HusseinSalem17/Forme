
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/api/api_consumer.dart';
import 'package:image_picker/image_picker.dart';
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
  XFile? image;
  postTrainerCompleteProfile() async {
    try {
      emit(TrainerCompleteProfileLoading());

      await api.patch('/auth/complete_profile_trainer/',
          data: {
            "user": {
              "username": name,
              "date_of_birth": dateOfBirth,
              "country": country,
              "phone_number": phone,
              "profile_picture": image,
              "gender": gender
            },
            "sport_field": sportField
          },
          isFromData: true);
      //final trainerModel = TrainerModel.fromJson(response);
      //debugPrint(trainerModel.user?.username);
      emit(TrainerCompleteProfileSuccess(message: 'success'));
    } catch (e) {
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
