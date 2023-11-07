import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector iconWidget(String iconName, void Function()? onTap) {
  return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60.w,
        height: 60.w,
        child: Image.asset("assets/image/Icon/$iconName.png"),
      ));
}
