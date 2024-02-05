import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/search/data/sports_club_search_card_model.dart';
import 'package:forme_app/features/user_features/search/presentation/views/tabs/tabs_cards/search_sports_club_tab_card.dart';


class SearchSportsClubTab extends StatelessWidget {
  const SearchSportsClubTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(left : 24.h, right: 24.h, bottom: 16.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Results for \"GYM\" ",
                    style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900PrimaryTextColor, fontSize: 16.sp),
                  ),
                  Text(
                    "${sportsClubSearchCardModel.length} Results Found",
                    style: TextStyles.cardTextStyle.copyWith(color: AppColors.secondaryColor, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sportsClubSearchCardModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: SearchSportsClubTabCard(
                      model: sportsClubSearchCardModel[index],
                      size: size,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
