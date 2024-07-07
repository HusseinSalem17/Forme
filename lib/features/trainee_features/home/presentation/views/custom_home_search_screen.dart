import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

import '../../../../../core/widgets/custom_app_bar_arrow_button.dart';
import '../../../Trainer_details/presentation/views/trainer_details_view.dart';

class CustomSearchHomeScreen extends SearchDelegate {
  List<String> searchTerms = [
    'Ahmad Ramy',
    'kareem',
    'saad',
    'marwan',
    'islam',
    'hassan',
    'Gold\'s Gym',
    '24 Hour Fitness',
    'Planet Fitness',
    'Anytime Fitness',
    'Equinox',
    'LA Fitness',
    'Snap Fitness',
    'Crunch Fitness',
    'YMCA',
    'Life Time',
    'Orangetheory Fitness',
    'PureGym',
    'Blink Fitness',
    'Retro Fitness',
    'World Gym',
    'GoodLife Fitness',
    'Virgin Active',
    'F45 Training',
    'Fitness First',
    'Barry\'s Bootcamp',
    'The Little Gym',
    'SoulCycle',
    'UFC Gym',
    'David Lloyd Clubs',
    'Fitness Together',
    'Chuze Fitness',
    'Fit4Less',
    'Genesis Health Clubs'
  ];

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search Trainer';

  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle {
    return TextStyles.baseRegular.copyWith(color: AppColors.n900Black);
  }

  @override
  // TODO: implement searchFieldDecorationTheme
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        constraints: const BoxConstraints(
          maxHeight: 40,
          minHeight: 30,
        ),
        contentPadding: const EdgeInsets.only(left: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.dg),
          borderSide: const BorderSide(
            color: AppColors.n40Gray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.dg),
          borderSide: const BorderSide(
            color: AppColors.n40Gray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.dg),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(18 / 2),
          ),
          child: GestureDetector(
            onTap: () {
              query = '';
            },
            child: const Icon(
              Icons.clear,
              size: 10,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return CustomAppBarArrowButton(
      onTap: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TrainerDetailsScreen(),
              ),
            );
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TrainerDetailsScreen(),
              ),
            );
          },
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}
