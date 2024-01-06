import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/features/complete_profile/data/repos/complete_profile_repo_impl.dart';
import 'package:forme_app/features/complete_profile/presentation/manager/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
import 'package:flutter/services.dart';
import 'package:forme_app/routes.dart';
import 'core/utils/functions/service_locator.dart';
import 'core/utils/scroll_behavior.dart';
import 'features/home/presentation/manager/bloc/home_bloc.dart';
import 'features/preferences/presentation/manager/preferences_bloc.dart';

void main() {
  setupServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
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
          create: (context) => OnBoardingBloc(),
        ),
        BlocProvider(
          create: (context) => PreferencesBloc(),
        ),
        BlocProvider(
          create: (context) =>
              CompleteProfileCubit(getIt.get<CompleteProfileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
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
