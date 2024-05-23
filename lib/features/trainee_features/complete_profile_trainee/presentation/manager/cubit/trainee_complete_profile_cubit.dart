import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/api/api_consumer.dart';
import 'package:forme_app/core/utils/functions/utils.dart';
import 'package:image_picker/image_picker.dart';
part 'trainee_complete_profile_state.dart';

class TraineeCompleteProfileCubit extends Cubit<TraineeCompleteProfileState> {
  final ApiConsumer api;

  TraineeCompleteProfileCubit(this.api) : super(TraineeCompleteProfileState());

  String? name;
  String? country;
  String? phone;
  String? gender;
  XFile? image;
  postTraineeCompleteProfile() async {
    try {
      emit(TraineeCompleteProfileLoading());

      await api.patch('/auth/complete_profile_trainee/',
          data: {
            "username": name,
            "country": country,
            "phone_number": phone,
            "profile_picture":
                "data:${image!.path.split('/').last};base64,${await Utils().convertXFileToBase64(image!)}",
            "gender": gender
          },
          isFromData: true);
      //final trainerModel = TrainerModel.fromJson(response);
      //debugPrint(trainerModel.user?.username);
      emit(TraineeCompleteProfileSuccess(message: 'success'));
    } catch (e) {
      emit(TraineeCompleteProfileFailure(errMessage: 'failure'));
    }
  }
}
