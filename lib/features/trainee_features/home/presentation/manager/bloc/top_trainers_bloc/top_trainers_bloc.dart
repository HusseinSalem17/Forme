import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'top_trainers_event.dart';
part 'top_trainers_state.dart';

class TopTrainersBloc extends Bloc<TopTrainersEvent, TopTrainersState> {
  TopTrainersBloc() : super(TopTrainersInitial()) {
    on<TopTrainersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
