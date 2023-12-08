import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/home/presentation/views/widgets/type_and_state.dart';
import 'card_image_section.dart';
import 'package:figma_squircle/figma_squircle.dart';

class VerticalCardItem extends StatelessWidget {
  const VerticalCardItem({
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
          width: size.width,
          height: size.height / 6.25,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CardImageSection(
                  height: size.height / 2,
                  width: size.width / 3,
                  bottomPadding: 0,
                  leftPaddingIcon: 88,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const TypeAndState(
                            type: 'Yoga',
                            state: 'Open',
                          ),
                          SizedBox(
                            width: size.width / 4,
                          ),
                          const Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: AppColors.starColor,
                          ),
                          Text(
                            '4.9',
                            style: Styles.cardTextStyle.copyWith(
                              color: AppColors.n200BodyContentColor,
                              fontSize: 9,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Mindful Movement',
                        style: Styles.blackCardTextStyle,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/image/Icon/pin-map.svg'),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              'Prot Said, EGY',
                              style: Styles.cardTextStyle.copyWith(
                                color: AppColors.n200BodyContentColor,
                                fontSize: 11,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ 1500 ',
                            style: Styles.cardTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '/month',
                            style: Styles.cardTextStyle.copyWith(
                              color: AppColors.n200BodyContentColor,
                              fontSize: 8,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}