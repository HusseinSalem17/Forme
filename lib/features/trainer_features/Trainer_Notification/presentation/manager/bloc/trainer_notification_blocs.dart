import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainer_features/Trainer_Notification/presentation/manager/bloc/trainer_notification_events.dart';
import 'package:forme_app/features/trainer_features/Trainer_Notification/presentation/manager/bloc/trainer_notification_states.dart';


class TrainerNotificationBloc extends Bloc<TrainerNotificationEvent, TrainerNotificationState> {
  TrainerNotificationBloc() : super(TrainerNotificationState(icon: 'icon', title: '30% Discount', description: 'description 1', isUnread: false, time: '2d')) {
    on<TrainerNotificationEvent>((event, emit) {
      emit(TrainerNotificationState(
        icon: state.icon,
        title: state.title,
        time: state.time,
        description: state.description,
        isUnread: state.isUnread,
      ));
    });
  }
}
