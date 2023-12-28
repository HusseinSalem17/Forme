import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';


class ReviewSummary extends StatelessWidget {
  const ReviewSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Review Summary'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Wrap(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: ShapeDecoration(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            right: 11,
                            top: 11,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_border,
                                color: AppColors.p300PrimaryColor,
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
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: AppColors.starColor,
                              ),
                              Text(
                                '4.9',
                                style: TextStyles.cardTextStyle.copyWith(
                                  color: AppColors.n200BodyContentColor,
                                  fontSize: 9,
                                ),
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
                              const Icon(
                                Icons.location_on_sharp,
                                color: AppColors.n200BodyContentColor,
                                size: 18,

                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Port Said, EGY',
                                style: TextStyles.cardTextStyle.copyWith(
                                  color: AppColors.n200BodyContentColor,
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
                                  color: AppColors.n200BodyContentColor,
                                  fontSize: 9,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
