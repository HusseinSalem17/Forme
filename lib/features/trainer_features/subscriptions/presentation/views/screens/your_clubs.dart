import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/subscriptions/data/your_clubs_cards_model.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/widgets/your_clubs_cards.dart';

class YourClubsScreen extends StatelessWidget {
  const YourClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Your Clubs',
            style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
        toolbarHeight: 80.h,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 11, right: 17),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: yourClubsCardsModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: YourClubsCards(
                      model: yourClubsCardsModel[index],
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
