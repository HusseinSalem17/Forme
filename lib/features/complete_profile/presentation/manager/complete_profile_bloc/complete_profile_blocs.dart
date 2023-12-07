// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forme_app/features/complete_profile/data/repos/complete_profile_repo.dart';

// import 'complete_profile_events.dart';
// import 'complete_profile_states.dart';

// class CompleteProfileBloc
//     extends Bloc<CompleteProfileEvent, CompleteProfileState> {
//   CompleteProfileRepo completeRepo;

//   CompleteProfileBloc(this.completeRepo) : super(const CompleteProfileState()) {
//     on<NameEvent>(_nameEvent);
//     on<PhotoEvent>(_photoEvent);
//     on<PhoneEvent>(_phoneEvent);
//     on<GenderEvent>(_genderEvent);
//     on<CountryEvent>(_countryEvent);
//   }

//   void handleCompleteProfile(String type) {
//     completeRepo.handleCompleteProfile(type);
//   }

//   void _nameEvent(NameEvent event, Emitter<CompleteProfileState> emit) {
//     print('my email is ${event.name}');
//     emit(
//       state.copyWith(
//         name: event.name,
//       ),
//     );
//   }

//   void _photoEvent(PhotoEvent event, Emitter<CompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         photo: event.photo,
//       ),
//     );
//   }

//   void _phoneEvent(PhoneEvent event, Emitter<CompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         phone: event.phone,
//       ),
//     );
//   }

//   void _genderEvent(GenderEvent event, Emitter<CompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         gender: event.gender,
//       ),
//     );
//   }

//   void _countryEvent(CountryEvent event, Emitter<CompleteProfileState> emit) {
//     emit(
//       state.copyWith(
//         country: event.country,
//       ),
//     );
//   }
// }
