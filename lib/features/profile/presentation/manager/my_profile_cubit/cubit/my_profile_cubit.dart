import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileInitial());
}
