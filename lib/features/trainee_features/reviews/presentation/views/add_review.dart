import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:forme_app/features/trainee_features/sports_club/presentation/views/sections/club_sub_header.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/sections/workout_sub_header.dart';
// import 'package:simple_star_rating/simple_star_rating.dart';

class AddReview extends StatelessWidget {
  static const routeName = '/add-review-screen';
  final String type;
  const AddReview({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 1,
              automaticallyImplyLeading: false,
              expandedHeight: MediaQuery.sizeOf(context).height / 5,
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 20.h),
                  child: CustomAppBarArrowButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(),
              ],
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
                    type == "club" ? clubSubHeader() : workoutSubHeader(),
                    Padding(
                      padding: EdgeInsets.only(top: 21.h),
                      child: Text('Your Overall rating of this product',
                          style: TextStyles.textStyleRegular
                              .copyWith(fontSize: 14.sp)),
                    ),
                    // SimpleStarRating(
                    //   allowHalfRating: true,
                    //   isReadOnly: false,
                    //   starCount: 5,
                    //   //rating: model.rating,
                    //   size: 70,
                    //   spacing: 1,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 8.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Add detailed reviews',
                            style: TextStyles.textStyleBold.copyWith(
                                fontSize: 14.sp, color: AppColors.n900Black)),
                      ),
                    ),
                    const TextArea(
                      title: 'Add detailed reviews',
                    ),
                    const SizedBox(
                      height: 300,
                    )
                  ]),
                ),
              ),
            )
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Submit',
              onTap: () {
                // do submit review actions
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
