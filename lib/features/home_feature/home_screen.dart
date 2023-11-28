import 'package:flutter/material.dart';
import 'package:forme_app/features/home_feature/widgets_of_home_screen/special_programs_list.dart';
import 'package:forme_app/features/home_feature/widgets_of_home_screen/top_trainers_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TopTrainersSection(),
          SpecialProgramsCardList()
        ],
      ),
    );
  }
}
