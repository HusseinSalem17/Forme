import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/pages/onboarding_screen/data/bloc/onboarding_events.dart';
import 'package:forme_app/pages/onboarding_screen/data/bloc/onboarding_states.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {
    on<OnboardingEvent>((event, emit) {
      emit(OnboardingState(page: state.page));
    });
  }
}
