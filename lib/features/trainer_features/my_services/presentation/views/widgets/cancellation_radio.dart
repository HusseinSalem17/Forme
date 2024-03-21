import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';


class CancellationRadio extends StatefulWidget {
  const CancellationRadio({super.key});

  @override
  State<CancellationRadio> createState() => _CancellationRadioState();
}

class _CancellationRadioState extends State<CancellationRadio> {
  int reviews = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              reviews = 1;
              if (kDebugMode) {
                print('$reviews');
              }
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                activeColor: AppColors.p300PrimaryColor,
                value: 1,
                groupValue: reviews,
                onChanged: (value) {
                  setState(() {
                    reviews = value!;
                    if (kDebugMode) {
                      print('$reviews');
                    }
                  });
                },
              ),
              Text(
                "Financial Reason",
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              reviews = 2;
              if (kDebugMode) {
                print('$reviews');
              }
            });
          },
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.p300PrimaryColor,
                value: 2,
                groupValue: reviews,
                onChanged: (value) {
                  setState(() {
                    reviews = value!;
                    if (kDebugMode) {
                      print('$reviews');
                    }
                  });
                },
              ),
              Text(
                "Lack Of Time",
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              reviews = 3;
              if (kDebugMode) {
                print('$reviews');
              }
            });
          },
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.p300PrimaryColor,
                value: 3,
                groupValue: reviews,
                onChanged: (value) {
                  setState(() {
                    reviews = value!;
                    if (kDebugMode) {
                      print('$reviews');
                    }
                  });
                },
              ),
              Text(
                "Relocation",
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              reviews = 4;
              if (kDebugMode) {
                print('$reviews');
              }
            });
          },
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.p300PrimaryColor,
                value: 4,
                groupValue: reviews,
                onChanged: (value) {
                  setState(() {
                    reviews = value!;
                    if (kDebugMode) {
                      print('$reviews');
                    }
                  });
                },
              ),
              Text(
                "Change in Fitness Goals",
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              reviews = 5;
              if (kDebugMode) {
                print('$reviews');
              }
            });
          },
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.p300PrimaryColor,
                value: 5,
                groupValue: reviews,
                onChanged: (value) {
                  setState(() {
                    reviews = value!;
                    if (kDebugMode) {
                      print('$reviews');
                    }
                  });
                },
              ),
              Text(
                "Alternative Fitness Option",
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              reviews = 6;
              if (kDebugMode) {
                print('$reviews');
              }
            });
          },
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.p300PrimaryColor,
                value: 6,
                groupValue: reviews,
                onChanged: (value) {
                  setState(() {
                    reviews = value!;
                    if (kDebugMode) {
                      print('$reviews');
                    }
                  });
                },
              ),
              Text(
                "Other",
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
