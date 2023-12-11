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
    fontSize: 20.sp,
    color: AppColors.p300PrimaryColor,
  );
  static const heading4Bold = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 22,
    color: AppColors.neutralsN9,
    fontWeight: FontWeight.w700,
  );

//hint style
  static TextStyle hintStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14.sp,
    color: AppColors.n70HintColor,
  );

//card style
  static TextStyle cardTextStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    color: AppColors.p300PrimaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 8.sp,
  );
  static TextStyle blackCardTextStyle = TextStyle(
    color: AppColors.neutralsN9,
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );

//other styles
  //Regular
  static const textStyleRegular = TextStyle(
    fontFamily: 'RobotoRegular',
    color: AppColors.n100Color,
    fontWeight: FontWeight.w400,
  );

  //medium
  static const textStyleMedium = TextStyle(
    fontFamily: 'RobotoMedium',
    color: AppColors.n100Color,
  );

  //bold
  static const textStyleBold = TextStyle(
    fontFamily: 'RobotoBold',
    color: AppColors.n100Color,
  );

  static const appTitleStyle = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 18,
    color: AppColors.neutralsN9,
  );
}
