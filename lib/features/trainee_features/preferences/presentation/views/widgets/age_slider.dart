import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController();
  int _scrollIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      _scrollController.animateToItem(
        3,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutQuart,
      );
    });
    // Add a listener to the scroll controller

    _scrollController.addListener(
      () {
        // Calculate the index based on the scroll offset and item height
        int newIndex = (_scrollController.offset / 60.h)
            .round(); // Adjust 100 to your item height
        // Update the index if it has changed
        if (newIndex != _scrollIndex) {
          setState(
            () {
              _scrollIndex = newIndex;
            },
          );
          debugPrint('age is $_scrollIndex');
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 368.h,
      width: 120.w,
      child: Stack(
        children: [
          ListWheelScrollView(
            controller: _scrollController,
            itemExtent: 60.h,
            perspective: 0.001,
            diameterRatio: 3,
            children: List<Widget>.generate(
              100,
              (int index) {
                return numbers(
                  index,
                  _scrollIndex == index
                      ? TextStyles.textStyleRegular.copyWith(
                          fontSize: 56.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600)
                      : _scrollIndex == index + 1 || _scrollIndex == index - 1
                          ? TextStyles.textStyleRegular.copyWith(
                              fontSize: 48.sp,
                              color: AppColors.n900Black,
                            )
                          : _scrollIndex == index + 2 ||
                                  _scrollIndex == index - 2
                              ? TextStyles.textStyleRegular.copyWith(
                                  fontSize: 40.sp,
                                  color: AppColors.n900Black.withOpacity(0.4),
                                )
                              : TextStyles.textStyleRegular.copyWith(
                                  fontSize: 32.sp,
                                  color: AppColors.n900Black.withOpacity(0.1),
                                ),
                );
              },
            ),
          ),
          Positioned(
            top: 148.h,
            child: Container(
              height: 2.h,
              width: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.primaryColor),
            ),
          ),
          Positioned(
            top: 220.h,
            child: Container(
              height: 2.h,
              width: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Center numbers(int index, TextStyle style) {
    return Center(
      child: Text(
        (index + 1).toString(),
        style: style,
      ),
    );
  }
}
