import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_profile_state.dart';

class MyProfileTrainerCubit extends Cubit<MyProfileTrainerState> {
  MyProfileTrainerCubit() : super(MyProfileTrainerInitial());
}
