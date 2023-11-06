import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

GestureDetector iconWidget(String iconName, void Function()? onTap) {
  return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60.w,
        height: 60.w,
        child: SvgPicture.asset("assets/image/Icon/$iconName.svg"),
      ));
}
