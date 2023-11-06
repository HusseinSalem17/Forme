import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';

abstract class Styles {
//description style
  static const kDescriptionStyle = TextStyle(
      fontFamily: 'RobotoLight',
      fontSize: 18,
      color: AppColors.p300PrimaryColor,
      fontWeight: FontWeight.bold);
  static const descriptionStyle = TextStyle(
      fontFamily: 'RobotoLight',
      fontSize: 17,
      color: AppColors.n100Color,
      fontWeight: FontWeight.bold);
// headers styles
  static const kHeaderStyle = TextStyle(
      fontFamily: 'RobotoBold',
      fontSize: 32,
      color: AppColors.p300PrimaryColor);
  static const headerStyle = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 32,
    color: AppColors.n900PrimaryTextColor
  );
//hint style
  static const hintStyle = TextStyle(
    fontFamily: 'RobotoLight',
    fontSize: 16,
    color: AppColors.n100Color,
  );
//other styles
  //light
  static const textStyleLight12 = TextStyle(
    fontFamily: 'RobotoLight',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleLight14 = TextStyle(
    fontFamily: 'RobotoLight',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleLight16 = TextStyle(
    fontFamily: 'RobotoLight',
    fontSize: 16,
    color: AppColors.n100Color,
  );
  static const textStyleLight18 = TextStyle(
    fontFamily: 'RobotoLight',
    fontSize: 18,
    color: AppColors.n100Color,
  );
  //medium
  static const textStyleMedium12 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleMedium14 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleMedium16 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 16,
    color: AppColors.n100Color,
  );
  static const textStyleMedium18 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 18,
    color: AppColors.n100Color,
  );
  //bold
  static const textStyleBold12 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleBold14 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleBold16 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 16,
    color: AppColors.n100Color,
  );
  static const textStyleBold18 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 18,
    color: AppColors.n100Color,
  );
}
