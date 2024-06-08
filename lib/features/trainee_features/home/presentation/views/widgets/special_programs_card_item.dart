import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import '../../../../../../core/test_models/top_trainers_model.dart';
import 'list_card_image.dart';
import 'special_programs_card_review.dart';

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
          width: size.width / 1.9,
          height: size.height / 3.52,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  ListCardImage(
                    imageUrl: topTrainersData[1].imageUrl,
                    leftPaddingIcon: 154,
                    height: size.height / 3.75 / 2,
                    width: size.width,
                  ),
                  Positioned(
                    right: size.width / 1.9 / 3,
                    bottom: -14,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: AppColors.n20FillBodyInBigCardColor),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.asset(
                          topTrainersData[1].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpecialProgramsCardReview(),
                      Text(
                        'Mindful Movement',
                        style: TextStyles.smallBold
                            .copyWith(color: AppColors.n900Black),
                      ),
                      const SizedBox(
                        height: 4,
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
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            'E£ 150.30 ',
                            style: TextStyles.cardTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '/ 4 weeks',
                            style: TextStyles.cardTextStyle.copyWith(
                              color: AppColors.n200Gray,
                              fontSize: 9,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
