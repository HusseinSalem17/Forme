import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trainee_profile_state.dart';

class TraineeProfileCubit extends Cubit<TraineeProfileState> {
  TraineeProfileCubit() : super(TraineeProfileInitial());
}
