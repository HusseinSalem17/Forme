import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forme_app/features/profile/data/repos/complete_profile_repo.dart';
import '../../../data/models/Complete_profile_data.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit(this.completeProfileRep)
      : super(CompleteProfileInitial());

  final CompleteProfileRepo completeProfileRep;

  void handleCompleteProfile({required CompleteProfileData data}) {
    emit(CompleteProfileLoading());
    var result = completeProfileRep.handleCompleteProfile(data: data);
    result.fold(
      (failure) {
        emit(CompleteProfileFailure(errMessage: failure.errMessage));
      },
      (response) {
        emit(CompleteProfileSuccess(message: response));
      },
    );
  }
}
