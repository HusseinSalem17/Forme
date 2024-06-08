import 'package:flutter/material.dart';

abstract class Dimensions {
  static double halfHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 2;
  static double halfWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 2;
  static double quarterHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 4;
  static double quarterWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 4;
  static double thirdHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 3;
  static double thirdWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / 3;
}
