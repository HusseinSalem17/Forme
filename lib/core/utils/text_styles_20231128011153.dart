import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

//semibold equal bold with size less 2px

abstract class TextStyles {
//description style
  static TextStyle kDescriptionStyle = TextStyle(
    height: 1.5,
    fontFamily: 'RobotoRegular',
    fontSize: 18.sp,
    color: AppColors.p300PrimaryColor,
  );
  static TextStyle descriptionStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14.sp,
    color: AppColors.n100Color,
  );

// headers styles

  static TextStyle headerStyle = TextStyle(
    fontFamily: 'RobotoBold',
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.p300PrimaryColor,
  );

//hint style
  static TextStyle hintStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14.sp,
    color: AppColors.n70HintColor,
  );

//other styles
//Regular
  static TextStyle textStyleRegular14 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleRegular16 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 16.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleRegular18 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 18.sp,
    color: AppColors.n100Color,
  );

  //medium
  static TextStyle textStyleMedium10 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 10.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleMedium12 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 12.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleMedium14 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 14.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleMedium16 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 16.sp,
    color: AppColors.n100Color,
  );

  //bold
  static TextStyle textStyleBold10 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 10.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleBold12 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 12.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleBold14 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 14.sp,
    color: AppColors.n100Color,
  );
  static TextStyle textStyleBold16 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 16.sp,
    color: AppColors.n100Color,
  );

  static TextStyle heading4Bold = TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 22.sp,
      color: AppColors.neutralsN9,
      fontWeight: FontWeight.w700);
}
