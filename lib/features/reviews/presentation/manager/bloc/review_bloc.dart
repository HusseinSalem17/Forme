import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial()) {
    on<ReviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
