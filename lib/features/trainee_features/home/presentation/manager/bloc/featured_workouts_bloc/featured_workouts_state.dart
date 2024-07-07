part of 'featured_workouts_bloc.dart';

@immutable
sealed class FeaturedWorkoutsState {}

final class FeaturedWorkoutsInitial extends FeaturedWorkoutsState {}

final class GetFeaturedWorkoutsLoading extends FeaturedWorkoutsState {}

final class GetFeaturedWorkoutsSuccess extends FeaturedWorkoutsState {
  final List<FeaturedWorkoutModel> featuredWorkoutData;

  GetFeaturedWorkoutsSuccess({
    required this.featuredWorkoutData,
  });
}

final class GetFeaturedWorkoutsFailure extends FeaturedWorkoutsState {
  final String errorMsg;

  GetFeaturedWorkoutsFailure(this.errorMsg);
}
