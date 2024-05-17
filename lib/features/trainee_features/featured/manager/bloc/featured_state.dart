part of 'featured_bloc.dart';

sealed class FeaturedState extends Equatable {
  const FeaturedState();

  @override
  List<Object> get props => [];
}

final class FeaturedInitial extends FeaturedState {}
