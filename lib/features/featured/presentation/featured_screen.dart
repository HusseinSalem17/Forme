import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';

class FeaturedScreen extends StatelessWidget {
  static const routeName = '/featured-screen';
  final List<String> filterTypes;
  final String featureType;
  const FeaturedScreen(
      {super.key, required this.filterTypes, required this.featureType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(context, featureType),
        body: Padding(
          padding:
              EdgeInsets.only(top: 32.h, bottom: 16.h, left: 24.h, right: 24.h),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    filterTypes.length,
                    (int index) {
                      return filterType(filterTypes[index]);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Padding filterType(name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.n20FillBodyInSmallCardColor,
              borderRadius: BorderRadius.circular(20.dg)),
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
          child: Text(name,
              style: TextStyles.textStyleRegular.copyWith(fontSize: 16.sp))),
    );
  }
}
