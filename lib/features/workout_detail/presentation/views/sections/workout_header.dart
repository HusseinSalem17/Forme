import 'package:flutter/material.dart';
import 'package:forme_app/core/widgets/custom_tab_bar.dart';
import 'package:forme_app/features/sports_club/presentation/views/sections/club_sub_header.dart';

class WorkoutDetailHeader extends StatelessWidget {
  const WorkoutDetailHeader({
    super.key,
    required this.titles,
  });
  final List<String> titles;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        clubSubHeader(),
        CustomTabBar(titles: titles),
      ],
    );
  }
}
