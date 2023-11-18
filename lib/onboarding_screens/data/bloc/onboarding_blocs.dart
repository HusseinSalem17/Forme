import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_events.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_states.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingState()) {
    on<OnBoardingEvent>(
      (event, emit) {
        emit(OnBoardingState(page: state.page));
      },
    );
  }
}
