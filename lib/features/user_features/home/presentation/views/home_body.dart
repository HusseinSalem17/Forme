import 'package:flutter/material.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/features/user_features/featured/presentation/featured_screen.dart';
import 'package:forme_app/features/user_features/home/presentation/views/sections/home_app_bar.dart';
import 'package:forme_app/features/user_features/home/presentation/views/sections/listing.dart';
import 'package:forme_app/features/user_features/home/presentation/views/sections/top_trainers_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeAppBar(),
          TopTrainersSection(
            onTap: () {
              Navigator.of(context)
                  .push(PageSlideTransition(const FeaturedScreen(
                featureType: "Top trainer",
                filterTypes: ['all', 'GYM', 'Swimming', 'Boxing', 'Rumming'],
              )));
            },
          ),
          Listing(
            title: 'Special Programs',
            onTap: () {
              Navigator.of(context)
                  .push(PageSlideTransition(const FeaturedScreen(
                featureType: "Special Programs",
                filterTypes: ['all', 'GYM', 'Swimming', 'Boxing', 'Rumming'],
              )));
            },
          ),
          Listing(
              title: 'Featured Workouts',
              onTap: () {
                Navigator.of(context)
                    .push(PageSlideTransition(const FeaturedScreen(
                  featureType: "Featured Workouts",
                  filterTypes: [
                    'all',
                    'GYM',
                    'Swimming',
                    'Boxing',
                    'Rumming'
                  ],
                )));
              }),
          Listing(
            title: 'Special Offers Clubs',
            onTap: () {
              Navigator.of(context)
                  .push(PageSlideTransition(const FeaturedScreen(
                featureType: "Special Offers",
                filterTypes: ['all', 'GYM', 'Swimming', 'Boxing', 'Rumming'],
              )));
            },
            isVertical: true,
            listheight: 1.9,
          )
        ],
      ),
    );
  }
}
