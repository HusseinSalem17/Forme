import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final String title;
  final ValueChanged<String?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: value == groupValue
              ? AppColors.p300PrimaryColor
              : AppColors.n50dropShadowColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () {
          onChanged(value);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 24.0, // Set the desired size of the radio icon
                height: 24.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: value == groupValue
                        ? AppColors.p300PrimaryColor
                        : AppColors.n40BorderColor,
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: value == groupValue
                      ? Container(
                          width: 11.0,
                          height: 11.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.p300PrimaryColor,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: Styles.textStyleBold.copyWith(
                  fontSize:12.sp,
                  color: AppColors.n900PrimaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
