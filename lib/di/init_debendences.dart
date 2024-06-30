import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/special_programs_bloc/special_programs_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:forme_app/core/api_services/api_services.dart';
import 'package:forme_app/features/trainee_features/home/data/repos/home_repo.dart';
import '../features/trainee_features/home/data/repos/home_repo_implementation.dart';
import '../features/trainee_features/home/data/web_services/home_services.dart';
import '../features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

void setupLocator() {
  // Register ApiServices
  serviceLocator.registerLazySingleton<ApiServices>(
    () => ApiServices(),
  );

  // Register HomeServices
  serviceLocator.registerLazySingleton<HomeServices>(
    () => HomeServices(
      apiServices: serviceLocator<ApiServices>(),
    ),
  );

  // Register HomeRepo
  serviceLocator.registerLazySingleton<HomeRepo>(
    () => HomeRepoImplementation(
      homeServices: serviceLocator<HomeServices>(),
    ),
  );

  // Register BLoCs
  serviceLocator.registerFactory(
    () => TraineeHomeBloc(
      homeRepo: serviceLocator<HomeRepo>(),
    ),
  );

  // Register Bloc for SpecialPrograms
  serviceLocator.registerFactory(
    () => SpecialProgramsBloc(
      homeRepo: serviceLocator<HomeRepo>(),
    ),
  );
}
