import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:forme_app/features/Authentication/presentation/views/sign_up_screen.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/bottom_bar_screens.dart';
import 'package:forme_app/features/trainer_features/Trainer_Profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
import 'package:forme_app/features/trainer_features/Transformations/presentation/view/Transformations_screen.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/add_program_screen.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
import 'package:forme_app/features/trainer_features/trainee_profile/presentation/manager/trainee_profile_cubit.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/trainee_features/profile/data/repos/complete_profile_repo_impl.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/manager/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
import 'package:flutter/services.dart';
import 'package:forme_app/splash_screen.dart';
import 'app_routing/auth_routes.dart';
import 'app_routing/main_route.dart';
import 'core/user_type.dart';
import 'core/utils/functions/service_locator.dart';
import 'core/utils/scroll_behavior.dart';
import 'features/Authentication/presentation/views/sign_in_screen.dart';
import 'features/trainer_features/complete_profile_trainer/presentation/views/trainer_complete_profile.dart';
import 'local_storage_data/auth_local/registration_data_local.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  // Retrieve the saved user type from local storage
  UserType? initialUserType = await RegistrationDataLocal.getUserType();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ),
  );
  runApp(MyApp(initialUserType: initialUserType));
  print(initialUserType);
}

class MyApp extends StatelessWidget {
  final UserType? initialUserType;

  const MyApp({Key? key, this.initialUserType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
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
            create: (context) =>
                CompleteProfileCubit(getIt.get<CompleteProfileRepoImpl>()),
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
          BlocProvider(
            create: (_) => AuthBloc(),
          ),
        ],
        child: MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: Themes.customLightTheme,
          //onGenerateRoute: (settings) => generateRoute(settings, context),
          // onGenerateRoute: (settings) {
          //   if (initialUserType == null) {
          //     return AuthRoutes().generateRoute(settings);
          //   } else {
          //     return AppRouter(
          //       userType: initialUserType!,
          //       context: context,
          //     ).generateRoute(settings);
          //   }
          // },

          home: const TrainerCompleteProfile(),
        ),
      ),
    );
  }
}
