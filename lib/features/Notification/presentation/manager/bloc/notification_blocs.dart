
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/Notification/presentation/manager/bloc/notification_events.dart';
import 'package:forme_app/features/Notification/presentation/manager/bloc/notification_states.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState(icon: 'icon', title: '30% Discount', description: 'description 1', isUnread: false, time: '2d')) {
    on<NotificationEvent>((event, emit) {
      emit(NotificationState(
        icon: state.icon,
        title: state.title,
        time: state.time,
        description: state.description,
        isUnread: state.isUnread,
      ));
    });
  }
}
