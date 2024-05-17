import 'package:bloc/bloc.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_event.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_state.dart';

class TrainerPreferenceBloc
    extends Bloc<TrainerPreferenceEvent, TrainerPreferenceState> {
  TrainerPreferenceBloc() : super(TrainerPreferenceState()) {
    on<TrainerPreferenceEvent>((event, emit) {
      emit(TrainerPreferenceState(page: state.page));
    });
  }
}
