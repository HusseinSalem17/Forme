// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forme_app/features/complete_profile/data/repos/complete_profile_repo.dart';

// import 'complete_profile_events.dart';
// import 'complete_profile_states.dart';

// class TrainerCompleteProfileBloc
//     extends Bloc<TrainerCompleteProfileEvent, TrainerCompleteProfileState> {
//   TrainerCompleteProfileRepo completeRepo;

//   TrainerCompleteProfileBloc(this.completeRepo) : super(const TrainerCompleteProfileState()) {
//     on<NameEvent>(_nameEvent);
//     on<PhotoEvent>(_photoEvent);
//     on<PhoneEvent>(_phoneEvent);
//     on<GenderEvent>(_genderEvent);
//     on<CountryEvent>(_countryEvent);
//   }

//   void handleCompleteProfile(String type) {
//     completeRepo.handleCompleteProfile(type);
//   }

//   void _nameEvent(NameEvent event, Emitter<TrainerCompleteProfileState> emit) {
//     print('my email is ${event.name}');
//     emit(
//       state.copyWith(
//         name: event.name,
//       ),
//     );
//   }

//   void _photoEvent(PhotoEvent event, Emitter<TrainerCompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         photo: event.photo,
//       ),
//     );
//   }

//   void _phoneEvent(PhoneEvent event, Emitter<TrainerCompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         phone: event.phone,
//       ),
//     );
//   }

//   void _genderEvent(GenderEvent event, Emitter<TrainerCompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         gender: event.gender,
//       ),
//     );
//   }

//   void _countryEvent(CountryEvent event, Emitter<TrainerCompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         country: event.country,
//       ),
//     );
//   }
// }
//
// void _countryEvent(CountryEvent event, Emitter<TrainerCompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         country: event.sportField,
//       ),
//     );
//   }
// }
