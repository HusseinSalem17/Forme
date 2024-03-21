import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'card_image_section.dart';
import 'card_review_section.dart';

class SpecialProgramsCardItem extends StatelessWidget {
  const SpecialProgramsCardItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: size.width / 2,
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
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CardImageSection(height: size.height / 3.75 / 2,width: size.width / 2 ),
                CardReviewSection(),
                Text(
                  'Mindful Movement',
                  style: TextStyles.blackCardTextStyle,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/image/personicon.svg'),
                    const SizedBox(width: 6),
                    Text(
                      'Kareem Muhamed',
                      style: TextStyles.cardTextStyle.copyWith(
                        color: AppColors.n200BodyContentColor,
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$ 150.30 ',
                      style: TextStyles.cardTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '/ 4 weeks',
                      style: TextStyles.cardTextStyle.copyWith(
                        color: AppColors.n200BodyContentColor,
                        fontSize: 9,
                      ),
                    )
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
