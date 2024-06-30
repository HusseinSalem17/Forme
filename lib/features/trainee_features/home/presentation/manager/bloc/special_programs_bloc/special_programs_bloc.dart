import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/trainer_profile_program_model.dart';
import '../../../../data/repos/home_repo.dart';

part 'special_programs_event.dart';
part 'special_programs_state.dart';

class SpecialProgramsBloc extends Bloc<SpecialProgramsEvent, SpecialProgramsState> {
  final HomeRepo homeRepo;
  SpecialProgramsBloc({required this.homeRepo}) : super(SpecialProgramsInitial()) {
    on<SpecialProgramsEvent>((event, emit) async {
      emit(GetSpecialProgramsLoading());
      final result = await homeRepo.getSpecialPrograms();
      result.fold(
            (error) => emit(
          GetSpecialProgramsFailure(error.message),
        ),
            (programs) => emit(
          GetSpecialProgramsSuccess(trainerProfileProgramData: programs),
        ),
      );
    });
  }
}
