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
      fontSize: 18,
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
  );
//hint style
  static const hintStyle = TextStyle(
    fontFamily: 'RobotoLight',
    fontSize: 16,
    color: AppColors.n100Color,
  );
//other styles
  static const textStyleMedium12 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 12,
    color: AppColors.n100Color,
  );
  static const textStyleMedium14 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 14,
    color: AppColors.n100Color,
  );
  static const textStyleMedium16 = TextStyle(
    fontFamily: 'RobotoBold',
    fontSize: 16,
    color: AppColors.n100Color,
  );
}
