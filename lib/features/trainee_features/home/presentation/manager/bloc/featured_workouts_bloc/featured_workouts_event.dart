part of 'featured_workouts_bloc.dart';

@immutable
sealed class FeaturedWorkoutsEvent {}

final class GetFeaturedWorkouts extends FeaturedWorkoutsEvent {}
