import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final String title;
  final Widget icon;
  final ValueChanged<String?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: 50.h,
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14,
                      color: AppColors.n100Color,
                    ),
                  ),
                ],
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
