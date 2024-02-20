import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trainer_details_event.dart';
part 'trainer_details_state.dart';

class TrainerDetailsBloc extends Bloc<TrainerDetailsEvent, TrainerDetailsState> {
  TrainerDetailsBloc() : super(TrainerDetailsInitial()) {
    on<TrainerDetailsEvent>((event, emit) {
    
    });
  }
}
