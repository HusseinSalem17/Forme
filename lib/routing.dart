// import 'package:flutter/material.dart';
// import 'package:forme_app/features/Authentication/presentation/views/forgot_password.dart';
// import 'package:forme_app/features/Authentication/presentation/views/new_password.dart';
// import 'package:forme_app/features/Authentication/presentation/views/sign_up_view.dart';
// import 'package:forme_app/features/Authentication/presentation/views/sign_in_view.dart';
// import 'package:forme_app/features/Authentication/presentation/views/verify_code.dart';
// import 'package:forme_app/features/user_features/book_appointment_with%20_trainer/presentation/views/book_appointment_screen.dart';
// import 'package:forme_app/features/user_features/join_program_feature/presentation/views/book_onling_coach_screen.dart';
// import 'package:forme_app/features/user_features/maps_feature/presentation/views/map_screen.dart';
// import 'package:forme_app/splash_screen.dart';
// import 'package:forme_app/onboarding_screens/views/onboarding_screen.dart';
//
// import 'app_routing/trainee_routes.dart';
//
// class UserRoutes {
//   TraineeRoutes trainee = TraineeRoutes();
//   static const String home = '/';
//   static const String onBoarding = OnBoardingView.routeName;
//   static const String signIn = SignInScreen.routeName;
//   static const String signUp = SignUpScreen.routeName;
//   static const String forgotPassword = ForgetPasswordScreen.routeName;
//   static const String verifyCode = VerifyCodeScreen.routeName;
//   static const String newPassword = NewPasswordScreen.routeName;
//
//   Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case BookOnlineCoachScreen.routeName:
//         return trainee.bookOnlineCoachScreen();
//       case MapScreen.routeName:
//         return trainee.mapScreen();
//       case BookAppointmentScreen.routeName:
//         return trainee.bookAppointmentWithTrainer();
//       default:
//         return _errorRoute();
//     }
//   }
//
//   Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) => const Scaffold(
//         body: Center(
//           child: Text('Error: Route not found!'),
//         ),
//       ),
//     );
//   }
// }
//
// class TrainerRoutes {
//   static const String home = '/trainer';
//   static const String completeProfile = '/trainer/completeProfile';
//
//   // Add other trainer routes here
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // Implement the logic for trainer routes
//     switch (settings.name) {
//       case home:
//         // return MaterialPageRoute(builder: (_) => TrainerHomeScreen());
//         // Replace the builder with your desired screen
//         return MaterialPageRoute(builder: (_) => const Placeholder());
//       case completeProfile:
//         // return MaterialPageRoute(builder: (_) => TrainerCompleteProfile());
//         // Replace the builder with your desired screen
//         return MaterialPageRoute(builder: (_) => const Placeholder());
//       // Add other trainer routes here
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(
//       builder: (_) => const Scaffold(
//         body: Center(
//           child: Text('Error: Route not found!'),
//         ),
//       ),
//     );
//   }
// }
//
// // Implement other feature-specific routes similarly
//
// // Route generator
// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     // User routes
//     case UserRoutes.home:
//     case UserRoutes.onBoarding:
//     case UserRoutes.signIn:
//     case UserRoutes.signUp:
//     case UserRoutes.forgotPassword:
//     case UserRoutes.verifyCode:
//     case UserRoutes.newPassword:
//       return UserRoutes().generateRoute(settings);
//     // Trainer routes
//     case TrainerRoutes.home:
//     case TrainerRoutes.completeProfile:
//       return TrainerRoutes.generateRoute(settings);
//     // Add other feature routes here
//     default:
//       return _errorRoute();
//   }
// }
// Route<dynamic> _errorRoute() {
//   return MaterialPageRoute(
//     builder: (_) => const Scaffold(
//       body: Center(
//         child: Text('Error: Route not found!'),
//       ),
//     ),
//   );
// }
