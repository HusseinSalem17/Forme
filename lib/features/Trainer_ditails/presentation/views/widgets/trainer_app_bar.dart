import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/test_models/top_trainers_model.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';

class TrainerDetailsAppBar extends StatelessWidget {
  const TrainerDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(children: [
        Row(
          children: [
            CustomAppBarArrowButton(
              onTap: () {},
            ),
            const Spacer(),
            CustomAppBarArrowButton(onTap: () {}, icon: Icons.share),
            CustomAppBarArrowButton(onTap: () {}, icon: Icons.favorite_border)
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            children: [
              SizedBox(
                width: 80.w,
                height: 80.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.dg),
                  child: Image.asset(
                    topTrainersData[0].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: SizedBox(
                  height: 61.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmed Ramy',
                        style: Styles.cardTextStyle.copyWith(
                            color: AppColors.n900PrimaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text('Trainer',
                          style: Styles.textStyleRegular
                              .copyWith(fontSize: 14.sp)),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/image/Icon/pin-map.svg',
                            color: AppColors.p300PrimaryColor,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text('Port Said, EGY',
                              style: Styles.textStyleRegular
                                  .copyWith(fontSize: 14.sp)),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
