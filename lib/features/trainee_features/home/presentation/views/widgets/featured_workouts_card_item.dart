import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import '../../../../../../core/test_models/top_trainers_model.dart';
import 'card_image_section.dart';
import 'special_card_review.dart';
import 'featured_card_review.dart';

class FeaturedWorkoutsCardItem extends StatelessWidget {
  const FeaturedWorkoutsCardItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: size.width / 1.9,
          height: size.height / 3.7,
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CardImageSection(
                  imageUrl:  topTrainersData[5].imageUrl,
                  height: size.height / 3.75 / 2,
                  width: size.width / 2,
                ),
                const FeaturedCardReview(),
                Text(
                  'Tennis',
                  style:
                      TextStyles.smallBold.copyWith(color: AppColors.n900Black),
                ),
                Row(
                  children: [
                    SvgPicture.asset(personIcon),
                    const SizedBox(width: 6),
                    Text(
                      'Kareem Muhamed',
                      style: TextStyles.cardTextStyle.copyWith(
                        color: AppColors.n200Gray,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
                Text(
                  'E£ 150.30 ',
                  style: TextStyles.cardTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
