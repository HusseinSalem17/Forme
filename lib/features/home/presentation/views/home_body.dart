import 'package:flutter/material.dart';
import 'package:forme_app/features/home/presentation/views/sections/home_app_bar.dart';
import 'package:forme_app/features/home/presentation/views/sections/listing.dart';
import 'package:forme_app/features/home/presentation/views/sections/top_trainers_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBar(),
            const TopTrainersSection(),
            Listing(
              title: 'Special Programs',
              onTap: () {},
            ),
            Listing(title: 'Featured Workouts', onTap: () {}),
            Listing(
              title: 'Special Offers Clubs',
              onTap: () {},
              isVertical: true,
              listheight: 1.9,
            )
          ],
        ),
      ),
    );
  }
}
