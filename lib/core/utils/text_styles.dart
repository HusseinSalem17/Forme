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
    color: AppColors.primaryColor,
  );
  static TextStyle descriptionStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14.sp,
    color: AppColors.n100Gray,
  );

// headers styles

  static TextStyle headerStyle = TextStyle(
    fontFamily: 'RobotoBold',
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    color: AppColors.primaryColor,
  );
  // used in (authentication,)
  static TextStyle mainScreenTitle = const TextStyle(
    fontFamily: 'RobotoBold',
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.n900Black,
  );

  static const heading4Bold = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 22,
    color: AppColors.n900Black,
    fontWeight: FontWeight.w700,
  );

//hint style
  static TextStyle hintStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14.sp,
    color: AppColors.n70Gray,
  );

//card style
  static TextStyle cardTextStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontSize: 8.sp,
  );
  static TextStyle blackCardTextStyle = TextStyle(
    color: AppColors.n900Black,
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );

//other styles
  //Regular
  static const textStyleRegular = TextStyle(
    fontFamily: 'RobotoRegular',
    color: AppColors.n100Gray,
  );
  // base,regular
  static const baseRegular = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14,
    color: AppColors.n70Gray,
  );

  //medium
  static const textStyleMedium = TextStyle(
    fontFamily: 'RobotoMedium',
    color: AppColors.n100Gray,
  );

  //bold
  static const textStyleBold = TextStyle(
    fontFamily: 'RobotoBold',
    color: AppColors.n100Gray,
  );
  static const largeBold = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 16,
    color: AppColors.n900Black,
  );
  // roboto
  static const textStyleSemiBold = TextStyle(
    fontFamily: 'Roboto',
    color: AppColors.n100Gray,
    fontWeight: FontWeight.w600,
  );

  static const appBarTitleStyle = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 18,
    color: AppColors.n900Black,
  );

  // small,bold
  static const smallBold = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 12,
    color: AppColors.n100Gray,
  );
  // small,regular
  static const smallRegular = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 12,
    color: AppColors.n70Gray,
  );
}
