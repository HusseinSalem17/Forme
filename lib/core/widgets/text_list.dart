import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TextList extends StatelessWidget {
  const TextList({
    super.key,
    required this.title,
    required this.values,
  });

  final List<String> title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
            title.length,
            (int index) {
              return Text(
                title[index],
                style: TextStyles.textStyleBold
                    .copyWith(height: 3, fontSize: 14.sp),
              );
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List<Widget>.generate(
            values.length,
            (int index) {
              return Text(
                values[index],
                style: TextStyles.textStyleBold.copyWith(
                    height: 3, fontSize: 14.sp, color: AppColors.n900Black),
              );
            },
          ),
        )
      ],
    );
  }
}
