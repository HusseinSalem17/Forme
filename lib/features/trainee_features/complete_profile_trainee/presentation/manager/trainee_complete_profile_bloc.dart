import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/models/profile_data_model.dart';
import '../../data/repos/trainee_complete_profile_implementation.dart';

part 'trainee_complete_profile_event.dart';

part 'trainee_complete_profile_state.dart';

class TraineeCompleteProfileBloc
    extends Bloc<TraineeCompleteProfileEvent, TraineeCompleteProfileState> {
  TrainerCompleteProfileRepoImpl trainerCompleteProfileRepoImpl =
      TrainerCompleteProfileRepoImpl();

  TraineeCompleteProfileBloc() : super(TraineeCompleteProfileInitial()) {
    on<ImagePicked>((event, emit) {
      emit(TraineeCompleteProfileLoading(image: event.image));
      try {
        emit(ImagePickedSuccess(event.image));
      } catch (error) {
        emit(TraineeCompleteProfileFailure(errorMsg: error.toString()));
      }
    });

    on<UpdateTraineeProfile>((event, emit) async {
      emit(TraineeCompleteProfileLoading());

      final result = await trainerCompleteProfileRepoImpl
          .updateTraineeCompleteProfile(data: event.data);
      result.fold((error) {
        emit(TraineeCompleteProfileFailure(errorMsg: error.toString()));
      }, (success) {
        emit(TraineeCompleteProfileSuccess());
      });
    });
  }
}
