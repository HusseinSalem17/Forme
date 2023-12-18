import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/workout_detail/presentation/views/sections/workout_sub_header.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class WorkoutReview extends StatelessWidget {
  static const routeName = '/workout-review-screen';
  const WorkoutReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 144.h,
              title: Stack(
                children: [
                  CustomAppBarArrowButton(
                    onTap: () {},
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: Image.asset(
                    'assets/image/temp/Header1.png',
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.dg),
                    color: AppColors.background),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(children: [
                    const Workout_sub_header(),
                    Padding(
                      padding: EdgeInsets.only(top: 21.h),
                      child: Text('Your Overall rating of this product',
                          style: TextStyles.textStyleRegular
                              .copyWith(fontSize: 14.sp)),
                    ),
                    SimpleStarRating(
                      allowHalfRating: true,
                      isReadOnly: false,
                      starCount: 5,
                      //rating: model.rating,
                      size: 70,
                      spacing: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 8.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Add detailed reviews',
                            style: TextStyles.textStyleBold.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.n900PrimaryTextColor)),
                      ),
                    ),
                    const TextArea(),
                    const SizedBox(
                      height: 250,
                    )
                  ]),
                ),
              ),
            )
          ]),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(buttonTitle: 'Submit'),
          )
        ],
      ),
    );
  }
}
