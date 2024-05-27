import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

toastInfo({
  required String msg,
  Color backgroundColor = AppColors.primaryColor,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}

void showToast({
  required String errorMessage,
  Toast toastLength = Toast.LENGTH_SHORT,
  ToastGravity gravity = ToastGravity.BOTTOM,
  Color backgroundColor = Colors.white,
  Color textColor = Colors.red,
}) {
  Fluttertoast.showToast(
    msg: errorMessage,
    toastLength: toastLength,
    gravity: gravity,
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}

void showCustomSnackbar(
    BuildContext context, String message, Color color, int snackType) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        snackType == 0
            ? const Icon(Icons.check_circle, color: AppColors.greenColor)
            : SvgPicture.asset("assets/image/Icon/danger.svg"),
        const SizedBox(width: 12.0),
        Expanded(
            child: Text(message,
                style: TextStyles.textStyleSemiBold
                    .copyWith(fontSize: 12.sp, color: AppColors.n400))),
      ],
    ),
    
    duration:const  Duration(seconds: 2),
    backgroundColor: color,
    //behavior: SnackBarBehavior.fixed,
    action: SnackBarAction(
      label: 'X',
      textColor: AppColors.n400,
      onPressed: () {
        // Hide the snackbar when the action is pressed
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8.r),
        bottomRight: Radius.circular(8.r),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
