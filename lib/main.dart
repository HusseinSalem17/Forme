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

import 'local_storage_data/auth_local/tokens.dart';
import 'local_storage_data/auth_local/user_type.dart';
import 'main_helper/app_initialization.dart';
import 'main_helper/bloc_providers.dart';

void main() async {
  await initializeApp();
  UserType? initialUserType = await getInitialUserType();
  runApp(MyApp(initialUserType: initialUserType));
}

class MyApp extends StatelessWidget {
  final UserType? initialUserType;

  const MyApp({Key? key, this.initialUserType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: getBlocProviders(),
        child: MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: Themes.customLightTheme,
          onGenerateRoute: (settings) {
            if (initialUserType == null) {
              print('User type is null');
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
