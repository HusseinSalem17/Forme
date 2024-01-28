import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/dashboard_screen.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
import 'package:forme_app/features/user_features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class TrainerHomeScreen extends StatefulWidget {
  static const routeName = '/trainer_home-screen';

  const TrainerHomeScreen({super.key});

  @override
  State<TrainerHomeScreen> createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  final List<Widget> _pages = [
    const SafeArea(child: Center(child: DashboardScreen())),
    const SafeArea(child: Center(child: Text('2'))),
    const SafeArea(child: Center(child: Text('3'))),
    const SafeArea(child: Center(child: Text('4'))),
    const SafeArea(child: Center(child: Text('5'))),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerHomeBloc, TrainerHomeState>(
      builder: (context, state) {
        int currentIndex =
            BlocProvider.of<TrainerHomeBloc>(context).currentIndex;
        return Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
