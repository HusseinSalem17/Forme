import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import '../../../../../../core/test_models/top_trainers_model.dart';
import '../../../data/models/trainer_profile_program_model.dart';
import 'list_card_image.dart';
import 'special_programs_card_review.dart';

class SpecialProgramsCardItem extends StatelessWidget {
  final Size size;
  final TrainerProfileProgram trainerProfileProgram;

  const SpecialProgramsCardItem({
    super.key,
    required this.size,
    required this.trainerProfileProgram,
  });

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
                    imageUrl: 'https://the18.com/sites/default/files/GettyImages-83034798.jpg',
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
                        color: AppColors.n20FillBodyInBigCardColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.network(
                          trainerProfileProgram.user.profilePicture!,
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
                        trainerProfileProgram.programs![0].title,
                        style: TextStyles.smallBold.copyWith(
                          color: AppColors.n900Black,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(personIcon),
                          const SizedBox(width: 6),
                          Text(
                            trainerProfileProgram.user.username,
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
