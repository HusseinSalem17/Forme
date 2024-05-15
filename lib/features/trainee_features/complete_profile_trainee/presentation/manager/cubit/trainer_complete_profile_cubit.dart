import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/api/dio_consumer.dart';

part 'trainer_complete_profile_state.dart';

class TraineeCompleteProfileCubit extends Cubit<TraineeCompleteProfileState> {
  final DioConsumer api;

  TraineeCompleteProfileCubit(this.api)
      : super(TraineeCompleteProfileInitial());
  String name = "";
}
