import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_theme.dart';
import 'package:forme_app/features/Authentication/presentation/manager/auth_bloc.dart';
import 'package:forme_app/features/trainer_features/Trainer_Profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
import 'package:forme_app/features/trainer_features/trainee_profile/presentation/manager/trainee_profile_cubit.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/manager/preferences_bloc.dart';
import 'package:forme_app/features/trainee_features/profile/data/repos/complete_profile_repo_impl.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/manager/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/manager/my_profile_cubit/cubit/my_profile_cubit.dart';
import 'package:forme_app/onboarding_screens/data/bloc/onboarding_blocs.dart';
import 'package:flutter/services.dart';
import 'app_routing/auth_routes.dart';
import 'app_routing/main_route.dart';
import 'core/user_type.dart';
import 'core/utils/functions/service_locator.dart';
import 'core/utils/scroll_behavior.dart';

import 'features/trainee_features/preferences/presentation/views/preferences_screen.dart';
import 'local_storage_data/auth_local/tokens.dart';
import 'local_storage_data/auth_local/user_type.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // Retrieve the saved user type from local storage
  UserType? initialUserType = await RegistrationDataLocal.getUserType();
  // Check if tokens are null
  String? accessToken = await UserTokenLocal.getAccessToken();
  String? refreshToken = await UserTokenLocal.getRefreshToken();
  if (accessToken == null || refreshToken == null || initialUserType == null) {
    // Tokens are null, navigate to the authentication flow
    print('access of refresh of user type is null');
    runApp(const MyApp(initialUserType: null));
  } else {
    // Tokens exist, navigate to the main app flow
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    runApp(MyApp(initialUserType: initialUserType));
  }
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
          onGenerateRoute: (settings) {
            if (initialUserType == null) {
              print('you are null');
              return AuthRoutes().generateRoute(settings);
            } else {
              return AppRouter(
                userType: initialUserType!,
                context: context,
              ).generateRoute(settings);
            }
          },
        ),
      ),
    );
  }
}
