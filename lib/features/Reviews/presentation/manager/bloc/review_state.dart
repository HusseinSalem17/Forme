part of 'review_bloc.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();
  
  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}
