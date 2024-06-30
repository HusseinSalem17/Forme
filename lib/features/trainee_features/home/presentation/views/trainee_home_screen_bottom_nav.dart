import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/favorite_screen.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/trainee_home_screen.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/custom_bottom_van_bar.dart';
import 'package:forme_app/features/trainee_features/maps_feature/presentation/views/map_screen.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/profile_screen.dart';

class TraineeHomeScreenBottomNav extends StatefulWidget {
  static const routeName = '/home-screen';

  const TraineeHomeScreenBottomNav({super.key});

  @override
  State<TraineeHomeScreenBottomNav> createState() => _TraineeHomeScreenBottomNavState();
}

class _TraineeHomeScreenBottomNavState extends State<TraineeHomeScreenBottomNav> {
  final List<Widget> _pages = [
    const SafeArea(child: TraineeHomeScreen()),
    const SafeArea(child: MapScreen()),
    const SafeArea(child: FavoriteScreen()),
    const SafeArea(child: Center(child: Text('4'))),
    const SafeArea(child: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraineeHomeBloc, TraineeHomeState>(
      builder: (context, state) {
        int currentIndex = BlocProvider.of<TraineeHomeBloc>(context).currentIndex;
        return Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: const CustomBottomNavBar(
            isTrainer: false,
            icons: ['home', 'pin-map', 'heart', 'chat', 'profile'],
            labels: ['Home', 'Explore', 'Favorite', 'chat', 'Profile'],
          ),
        );
      },
    );
  }
}
