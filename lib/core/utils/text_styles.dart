import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';

//semibold equal bold with size less 2px

abstract class Styles {
//description style
  static const kDescriptionStyle = TextStyle(
    height: 1.5,
    fontFamily: 'RobotoRegular',
    fontSize: 18,
    color: AppColors.p300PrimaryColor,
  );
  static const descriptionStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14,
    color: AppColors.n100Color,
  );

// headers styles
  static TextStyle kHeaderStyle = TextStyle(
      fontFamily: 'RobotoBold',
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: AppColors.p300PrimaryColor);

  static TextStyle headerStyle = TextStyle(
      fontFamily: 'RobotoBold',
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: AppColors.p300PrimaryColor);

//hint style
  static const hintStyle = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 16,
    color: AppColors.hintColor,
  );

//other styles
//Regular
  static const textStyleRegular10 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleRegular12 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleRegular14 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 16,
    color: AppColors.n100Color,
  );
  static const textStyleRegular16 = TextStyle(
    fontFamily: 'RobotoRegular',
    fontSize: 18,
    color: AppColors.n100Color,
  );

  //medium
  static const textStyleMedium10 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleMedium12 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleMedium14 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 16,
    color: AppColors.n100Color,
  );
  static const textStyleMedium16 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 18,
    color: AppColors.n100Color,
  );

  //bold
  static const textStyleBold10 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleBold12 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleBold14 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 16,
    color: AppColors.n100Color,
  );
  static const textStyleBold16 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 18,
    color: AppColors.n100Color,
  );
}
