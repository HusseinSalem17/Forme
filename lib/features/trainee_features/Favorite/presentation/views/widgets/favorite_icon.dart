import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';

List<Widget> actionsIcons(BuildContext context) {
  return [
    Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: CustomAppBarArrowButton(
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
    const Spacer(),
    CustomAppBarArrowButton(onTap: () {}, icon: Icons.share),
    Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: CustomAppBarArrowButton(onTap: () {}, icon: Icons.favorite_border),
    )
  ];
}
