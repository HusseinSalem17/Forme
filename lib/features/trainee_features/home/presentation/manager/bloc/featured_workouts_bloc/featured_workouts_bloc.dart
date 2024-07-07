import 'package:bloc/bloc.dart';
import 'package:forme_app/features/trainee_features/home/data/models/featured_workout_model.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/home_repo.dart';

part 'featured_workouts_event.dart';

part 'featured_workouts_state.dart';

class FeaturedWorkoutsBloc
    extends Bloc<FeaturedWorkoutsEvent, FeaturedWorkoutsState> {
  final HomeRepo homeRepo;

  FeaturedWorkoutsBloc({required this.homeRepo}) : super(FeaturedWorkoutsInitial()) {
    on<GetFeaturedWorkouts>((event, emit) async {
      emit(GetFeaturedWorkoutsLoading());
      final result = await homeRepo.getFeaturedWorkouts();
      result.fold(
        (error) => emit(
          GetFeaturedWorkoutsFailure(error.message),
        ),
        (featuredWorkout) => emit(
          GetFeaturedWorkoutsSuccess(featuredWorkoutData: featuredWorkout),
        ),
      );
    });
  }
}
