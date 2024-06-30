import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/functions/convert_to_base_64.dart';
import '../../data/models/trainee_complete_profile_data_model.dart';
import '../../data/repos/trainee_complete_profile_repo_implementation.dart';

part 'trainee_complete_profile_event.dart';
part 'trainee_complete_profile_state.dart';

class TraineeCompleteProfileBloc extends Bloc<TraineeCompleteProfileEvent, TraineeCompleteProfileState> {
  TrainerCompleteProfileRepoImpl trainerCompleteProfileRepoImpl = TrainerCompleteProfileRepoImpl();

  TraineeCompleteProfileBloc() : super(TraineeCompleteProfileInitial()) {
    on<ImagePicked>(_imagePickedEventCalled);
    on<UpdateTraineeProfile>(_updateTraineeProfile);
  }

  FutureOr<void> _updateTraineeProfile(UpdateTraineeProfile event, Emitter<TraineeCompleteProfileState> emit) async {
    emit(TraineeCompleteProfileLoading());

    final result = await trainerCompleteProfileRepoImpl.updateTraineeCompleteProfile(data: event.data);
    result.fold((error) {
      print('error in bloc');
      emit(TraineeCompleteProfileFailure(errorMsg: error.toString()));
    }, (success) {
      print('success in bloc');
      emit(TraineeCompleteProfileSuccess());
    });
  }

  FutureOr<void> _imagePickedEventCalled(ImagePicked event, Emitter<TraineeCompleteProfileState> emit) async {
    emit(TraineeCompleteProfileLoading(image: event.image));
    try {
      final imageBase64 = await convertXFileToBase64(event.image);
      emit(ImagePickedSuccess(event.image, imageBase64));
    } catch (error) {
      emit(TraineeCompleteProfileFailure(errorMsg: error.toString()));
    }
  }

  // Future<String> _convertImageToBase64(XFile imageFile) async {
  //   final bytes = await File(imageFile.path).readAsBytes();
  //   return base64Encode(bytes);
  // }
}
