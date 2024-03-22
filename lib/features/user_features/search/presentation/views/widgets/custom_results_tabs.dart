import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class SearchResultsTab extends StatelessWidget {
  final String searchText;
  final int searchResults;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const SearchResultsTab({super.key, 
    required this.searchText,
    required this.searchResults,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 32.0.h),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Results for \"$searchText\" ",
                    style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 16.sp),
                  ),
                  Text(
                    "$searchResults Results Found",
                    style: TextStyles.textStyleRegular.copyWith(color: AppColors.secondaryColor, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16), 
          ), // Add this line to add space between the text and the cards 
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: itemBuilder(context, index),
                );
              },
              childCount: searchResults,
            ),
          ),
        ],
      ),
    );
  }
}
