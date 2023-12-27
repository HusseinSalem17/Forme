import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/home/presentation/views/home_body.dart';
import 'package:forme_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:forme_app/features/profile/presentation/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const HomeBody(),
    const SafeArea(child: Center(child: Text('2'))),
    const SafeArea(child: Center(child: Text('3'))),
    const SafeArea(child: Center(child: Text('4'))),
    const SafeArea(child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int currentIndex = BlocProvider.of<HomeBloc>(context).currentIndex;
        return Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
