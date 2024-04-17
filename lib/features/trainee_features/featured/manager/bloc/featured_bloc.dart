import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'featured_event.dart';
part 'featured_state.dart';

class FeaturedBloc extends Bloc<FeaturedEvent, FeaturedState> {
  FeaturedBloc() : super(FeaturedInitial()) {
    on<FeaturedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
