import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClipRect extends StatelessWidget {
  final double size;
  const CustomClipRect({super.key, this.size = 130});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.h,
      width: size.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56.dg), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(4.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56.dg),
          child: Image.asset(
            'assets/image/m.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
