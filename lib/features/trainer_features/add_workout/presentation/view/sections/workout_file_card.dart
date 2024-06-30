import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class WorkOutFileCard extends StatelessWidget {
  final void Function()? onTap;
  final String title, time;
  const WorkOutFileCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.dg),
            border: Border.all(color: AppColors.n40Gray)),
        child: Row(
          children: [
            SvgPicture.asset('assets/image/Icon/drag-item.svg'),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.textStyleBold.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.n400,
                  ),
                ),
                Text(
                  time,
                  style: TextStyles.textStyleRegular.copyWith(
                    fontSize: 11.sp,
                    color: AppColors.n400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset('assets/image/Icon/icon-x.svg')),
          ],
        ));
  }
}
