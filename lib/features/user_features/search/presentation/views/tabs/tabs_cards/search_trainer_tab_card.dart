import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Trainer_ditails/presentation/views/widgets/custom_clip_rect.dart';
import 'package:forme_app/features/user_features/search/data/trainer_search_card_model.dart';
import 'package:forme_app/features/user_features/search/presentation/views/widgets/workout_icon.dart';

class SearchTrainerTabCard extends StatelessWidget {
  const SearchTrainerTabCard({super.key, required this.model, required this.size});
  final TrainerSearchCardModel model;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      width: size.width,
      height: size.height / 12,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
            color: AppColors.n50dropShadowColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 10,
            cornerSmoothing: 1,
          ),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomClipRect(imagePath: 'assets/image/workout_image.jpg'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
                ),
                Text(
                  model.category,
                  style: TextStyles.textStyleRegular.copyWith(
                    fontSize: 11.sp,
                  ),
                )
              ],
            ),
            const Spacer(),
            WorkoutIcon(
              icon: 'chat',
              onTap: () {},
            ),
            WorkoutIcon(
              icon: 'call',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
