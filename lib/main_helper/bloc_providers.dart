// // bloc_providers.dart
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:forme_app/features/Authentication/presentation/manager/auth_bloc.dart';
// import 'package:forme_app/features/trainer_features/Trainer_Profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
// import 'package:forme_app/features/trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
// import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';
// import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_bloc.dart';
// import 'package:forme_app/features/trainee_features/profile/data/repos/complete_profile_repo_impl.dart';
// import 'package:forme_app/features/trainee_features/profile/presentation/manager/complete_profile_cubit/complete_profile_cubit.dart';
// import 'package:forme_app/features/trainee_features/profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
// import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
//
// import '../core/utils/functions/service_locator.dart';
// import '../features/trainer_features/Trainee_profile/presentation/manager/trainee_profile_cubit.dart';
//
// List<BlocProvider> getBlocProviders(BuildContext context) {
//   return [
//     BlocProvider(
//       create: (context) => TraineeProfileCubit(),
//     ),
//     BlocProvider(
//       create: (context) => OnBoardingBloc(),
//     ),
//     BlocProvider(
//       create: (context) => PreferencesBloc(),
//     ),
//     BlocProvider(
//       create: (context) => CompleteProfileCubit(getIt.get<CompleteProfileRepoImpl>()),
//     ),
//     BlocProvider(
//       create: (context) => MyProfileCubit(),
//     ),
//     BlocProvider(
//       create: (context) => HomeBloc(),
//     ),
//     BlocProvider(
//       create: (context) => TrainerHomeBloc(),
//     ),
//     BlocProvider(
//       create: (context) => MyProfileTrainerCubit(),
//     ),
//     BlocProvider(
//       create: (_) => AuthBloc(),
//     ),
//   ];
// }
