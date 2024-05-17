import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TwoChoices extends StatefulWidget {
  final String text1;
  final String text2;
  final bool isIcon;
  final bool isMultiChoice;
  const TwoChoices(
      {super.key,
      required this.text1,
      required this.text2,
      this.isIcon = false,
      this.isMultiChoice = false});

  @override
  State<TwoChoices> createState() => _TwoChoicesState();
}

class _TwoChoicesState extends State<TwoChoices> {
  int selectedButton = 0;
  int multiChoice1 = 0;
  int multiChoice2 = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: widget.isMultiChoice
                  ? multiChoice1 == 1
                      ? AppColors.p50PrimaryColor
                      : AppColors.background
                  : selectedButton == 1
                      ? AppColors.p50PrimaryColor
                      : AppColors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isMultiChoice
                    ? multiChoice1 == 1
                        ? AppColors.primaryColor
                        : AppColors.n200Gray
                    : selectedButton == 1
                        ? AppColors.primaryColor
                        : AppColors.n200Gray,
              ),
            ),
            child: TextButton(
              onLongPress: () {
                setState(() {
                  if (widget.isMultiChoice) {
                    multiChoice1 = 0;
                  }
                });
              },
              onPressed: () {
                setState(() {
                  selectedButton = 1;
                  if (widget.isMultiChoice) {
                    multiChoice1 = 1;
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.isIcon
                      ? Icon(
                          Icons.male,
                          color: widget.isMultiChoice
                              ? multiChoice1 == 1
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray
                              : selectedButton == 1
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray,
                          size: 20.sp,
                        )
                      : Container(),
                  Text(
                    widget.text1,
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: widget.isMultiChoice
                          ? multiChoice1 == 1
                              ? AppColors.primaryColor
                              : AppColors.n200Gray
                          : selectedButton == 1
                              ? AppColors.primaryColor
                              : AppColors.n200Gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: widget.isMultiChoice
                  ? multiChoice2 == 1
                      ? AppColors.p50PrimaryColor
                      : AppColors.background
                  : selectedButton == 2
                      ? AppColors.p50PrimaryColor
                      : AppColors.background,
              border: Border.all(
                color: widget.isMultiChoice
                    ? multiChoice2 == 1
                        ? AppColors.primaryColor
                        : AppColors.n200Gray
                    : selectedButton == 2
                        ? AppColors.primaryColor
                        : AppColors.n200Gray,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onLongPress: () {
                setState(() {
                  if (widget.isMultiChoice) {
                    multiChoice2 = 0;
                  }
                });
              },
              onPressed: () {
                setState(() {
                  selectedButton = 2;
                  if (widget.isMultiChoice) {
                    multiChoice2 = 1;
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.isIcon
                      ? Icon(
                          Icons.female,
                          color: widget.isMultiChoice
                              ? multiChoice2 == 1
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray
                              : selectedButton == 2
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray,
                          size: 20.sp,
                        )
                      : Container(),
                  Text(
                    widget.text2,
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: widget.isMultiChoice
                          ? multiChoice2 == 1
                              ? AppColors.primaryColor
                              : AppColors.n200Gray
                          : selectedButton == 2
                              ? AppColors.primaryColor
                              : AppColors.n200Gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
