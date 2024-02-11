import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/user_features/search/presentation/views/recent_and_result/recent_search_screen.dart';

import 'views/widgets/custom_search_text_field.dart';


class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';
  const SearchScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 200),
        child: Padding(
          padding: EdgeInsets.only(top: 30.0, right: 16.0.h, left: 16.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBarArrowButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const CustomSearchTextField(),
            ],
          ),
        ),
      ),
      body: const RecentSearchScreen(),
    );
  }
}
