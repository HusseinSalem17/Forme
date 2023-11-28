import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    //const HomeBody(),
    const Text('1'),
    const Text('2'),
    const Text('3'),
    const Text('4'),
    const Text('5'),
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = BlocProvider.of<HomeBloc>(context).currentIndex;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
