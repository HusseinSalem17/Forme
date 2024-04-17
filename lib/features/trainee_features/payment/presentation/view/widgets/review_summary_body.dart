import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/join_program_feature/presentation/views/widgets/custom_radio_list_tile.dart';

class ReviewSummaryBody extends StatelessWidget {
  final sizeBox = SizedBox(
    height: 24.h,
  );

  ReviewSummaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Wrap(
            children: [
              Container(
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 1,
                    ),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 105,
                          width: 105,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'assets/image/m.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          right: 7,
                          top: 7,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.primaryColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 93.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                color: AppColors.n20Gray,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Yoga | Online Coaching',
                                  style: TextStyles.textStyleSemiBold.copyWith(
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/image/Icon/star.svg'),
                                Text(
                                  ' 4.9',
                                  style: TextStyles.cardTextStyle.copyWith(
                                    color: AppColors.n200Gray,
                                    fontSize: 9,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          'Mindful Movement',
                          style: TextStyles.blackCardTextStyle,
                        ),
                        SizedBox(height: 8.w),
                        Row(
                          children: [
                            SvgPicture.asset('assets/image/Icon/pin-map.svg'),
                            const SizedBox(width: 6),
                            Text(
                              'Port Said, EGY',
                              style: TextStyles.cardTextStyle.copyWith(
                                color: AppColors.n200Gray,
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8.w),
                        Row(
                          children: [
                            Text(
                              '\$ 1530 ',
                              style: TextStyles.cardTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '/ Month',
                              style: TextStyles.cardTextStyle.copyWith(
                                color: AppColors.n200Gray,
                                fontSize: 9,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.n40Gray,
          ),
          sizeBox,
          buildBookReviewSection('Booking Date', 'July 17, 2023 | 10:00 AM'),
          sizeBox,
          buildBookReviewSection('From', 'July 18, 2023'),
          sizeBox,
          buildBookReviewSection('To', 'November 03,2023'),
          sizeBox,
          buildBookReviewSection('Trainer', 'Kareem Muhamed'),
          SizedBox(
            height: 40.h,
          ),
          buildBookReviewSection('Amount', '\$1500.00'),
          sizeBox,
          buildBookReviewSection('Tax', '\$5.00'),
          SizedBox(
            height: 40.h,
          ),
          buildBookReviewSection('Total', '\$1505.00'),
          sizeBox,
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.n40Gray,
          ),
          sizeBox,
          CustomRadioListTile(
            title: 'Cash',
            value: '',
            groupValue: '',
            onChanged: (t) {},
            icon: SvgPicture.asset(
              'assets/image/Icon/cash.svg', // Replace with the path to your SVG file
            ),
            isTextButton: true,
          )
        ],
      ),
    );
  }

  Row buildBookReviewSection(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyles.textStyleSemiBold.copyWith(
            fontSize: 14,
            color: AppColors.n200Gray,
          ),
        ),
        Text(
          text2,
          style: TextStyles.textStyleSemiBold.copyWith(
            fontSize: 14,
            color: AppColors.n900Black,
          ),
        ),
      ],
    );
  }
}
