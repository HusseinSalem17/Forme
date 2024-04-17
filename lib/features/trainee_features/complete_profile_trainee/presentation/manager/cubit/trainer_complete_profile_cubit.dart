import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/data/models/trainer_complete_profile_data.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/data/repos/trainer_complete_profile_repo.dart';


part 'trainer_complete_profile_state.dart';

class TrainerCompleteProfileCubit extends Cubit<TrainerCompleteProfileState> {
  TrainerCompleteProfileCubit(this.completeProfileRep)
      : super(TrainerCompleteProfileInitial());

  final TrainerCompleteProfileRepo completeProfileRep;

  void handleTrainerCompleteProfile({required TrainerCompleteProfileData data}) {
    emit(TrainerCompleteProfileLoading());
    var result = completeProfileRep.handleTrainerCompleteProfile(data: data);
    result.fold(
      (failure) {
        emit(TrainerCompleteProfileFailure(errMessage: failure.errMessage));
      },
      (response) {
        emit(TrainerCompleteProfileSuccess(message: response));
      },
    );
  }
}
