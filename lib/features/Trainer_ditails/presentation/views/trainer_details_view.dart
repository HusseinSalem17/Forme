import 'package:flutter/material.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/about_trainer_view.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/trainer_storys_view.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/widgets/trainer_app_bar.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/widgets/trainer_tab_bar.dart';

class TrainerDetailsScreen extends StatelessWidget {
  static const routeName = '/Trainer-details-screen';
  const TrainerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List list = ["           About           ", "       Success Story      "];

    return DefaultTabController(
      length: list.length,
      child: MaterialApp(
          home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 200),
              child: Column(
                children: [
                  const TrainerDetailsAppBar(),
                  TrainerTabBar(list: list),
                ],
              ),
            ),
          ),
          body: const TabBarView(
              children: [AboutTrainerScreen(), TrainerStorysScreen()]),
        ),
      )),
    );
  }
}
