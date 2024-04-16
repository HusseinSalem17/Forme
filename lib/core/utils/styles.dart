import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

OutlineInputBorder textFieldBorder({
  Color color = AppColors.n40Gray,
  double width = 1.0,
}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.dg),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
