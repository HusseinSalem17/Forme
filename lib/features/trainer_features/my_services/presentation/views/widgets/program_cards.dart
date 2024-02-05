import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/workout_card_type.dart';
import 'package:forme_app/features/user_features/home/presentation/views/widgets/card_review_section.dart';
class CardsItem extends StatelessWidget {
  const CardsItem({super.key, required this.isPrograms});
  final bool isPrograms;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: size.width / 2.25,
          height: size.height / 3.75,
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
            color: AppColors.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: size.height / 3.75 / 2,
                  width: size.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/image/card_image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                isPrograms
                    ? const CardReviewSection()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WorkoutCardType(
                            type: 'Yoga',
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: AppColors.starColor,
                              ),
                              Text(
                                '4.9 (17 Reviews)',
                                style: TextStyles.cardTextStyle.copyWith(color: AppColors.n200BodyContentColor, fontSize: 9, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                Text(
                  'Mindful Movement',
                  style: TextStyles.blackCardTextStyle,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/image/People.svg'),
                    const SizedBox(width: 6),
                    Text(
                      'Your Clients: ',
                      style: TextStyles.cardTextStyle.copyWith(
                        color: AppColors.n200BodyContentColor,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      '23 clients',
                      style: TextStyles.cardTextStyle.copyWith(color: AppColors.p300PrimaryColor, fontSize: 11, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$150.00',
                      style: TextStyles.cardTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    isPrograms
                        ? Text(
                            ' /4 weeks',
                            style: TextStyles.cardTextStyle.copyWith(
                              color: AppColors.n200BodyContentColor,
                              fontSize: 9,
                            ),
                          )
                        : Text(
                            ' /20 videos',
                            style: TextStyles.cardTextStyle.copyWith(
                              color: AppColors.n200BodyContentColor,
                              fontSize: 9,
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}