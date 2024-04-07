import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/two_buttons.dart';
import 'package:forme_app/features/user_features/search/presentation/views/filter/sections/reviews_radio.dart';
import 'package:forme_app/features/user_features/search/presentation/views/widgets/filters_types.dart';
import 'package:forme_app/features/user_features/search/presentation/views/filter/sections/slider_price_range.dart';


class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CustomAppBarArrowButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: Text("Filter", style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Category', style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900Black, fontSize: 16.sp)),
                  SizedBox(height: 16.h),
                  const FilterType(type: "Category", categories: ['All', 'GYM', 'YOGA', 'Swimming', 'Running', 'Boxing']),
                  SizedBox(height: 16.h),
                  Text('Price Range', style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900Black, fontSize: 16.sp)),
                  SizedBox(height: 16.h),
                  const SliderPriceRange(),
                  SizedBox(height: 16.h),
                  Text('Reviews', style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900Black, fontSize: 16.sp)),
                  SizedBox(height: 16.h),
                  const ReviewsRadio(),
                  Text('Facilities', style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900Black, fontSize: 16.sp)),
                  SizedBox(height: 16.h),
                  const FilterType(type: "Facilities", categories: ['All', 'Car Parking', 'Locker', 'Shower', 'Cafe', 'Wifi', 'Personal Trainer']),
                  SizedBox(height: 16.h),
                  Text('Trainer Gender', style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.n900Black, fontSize: 16.sp)),
                  SizedBox(height: 16.h),
                  const FilterType(type: "Gender", categories: ['Both', 'Male', 'Female']),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TwoButtonsContainer(firstButtonTitle: 'Book Now', secondButtonTitle: 'Apply'),
          ),
        ],
      ),
    );
  }
}
