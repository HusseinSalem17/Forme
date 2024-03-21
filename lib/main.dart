import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/features/trainer_features/Trainer_Profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
import 'package:forme_app/features/trainer_features/trainee_profile/presentation/manager/trainee_profile_cubit.dart';
import 'package:forme_app/features/user_features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/user_features/preferences/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/user_features/profile/data/repos/complete_profile_repo_impl.dart';
import 'package:forme_app/features/user_features/profile/presentation/manager/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:forme_app/features/user_features/profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
import 'package:flutter/services.dart';
import 'package:forme_app/routes.dart';
import 'core/utils/functions/service_locator.dart';
import 'core/utils/scroll_behavior.dart';

void main() {
  setupServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.background,
      systemNavigationBarColor: AppColors.background,
      systemNavigationBarDividerColor: AppColors.background,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TraineeProfileCubit(),
        ),
        BlocProvider(
          create: (context) => OnBoardingBloc(),
        ),
        BlocProvider(
          create: (context) => PreferencesBloc(),
        ),
        BlocProvider(
          create: (context) => CompleteProfileCubit(getIt.get<CompleteProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => MyProfileCubit(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => TrainerHomeBloc(),
        ),
        BlocProvider(
          create: (context) => MyProfileTrainerCubit(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: Themes.customLightTheme,
          onGenerateRoute: (settings) => generateRoute(settings, context),
        ),
      ),
    );
  }
}
