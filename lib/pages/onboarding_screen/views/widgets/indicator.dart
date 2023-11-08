import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100.h,
      child: DotsIndicator(
        dotsCount:3,
        decorator: DotsDecorator(
          color: Colors.grey,
          activeColor: Colors.blue,
          size: Size.square(8.0),
          activeSize: Size(10.0, 8.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
