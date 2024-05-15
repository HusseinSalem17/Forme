import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            TableCell(
              child: Text('Trainee',
                  style: TextStyles.textStyleRegular
                      .copyWith(fontSize: 14.sp, height: 2)),
            ),
            TableCell(
              child: Text('Level',
                  style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp)),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('156,213',
                  style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp, color: AppColors.n900Black, height: 2)),
            ),
            TableCell(
              child: Text('Beginner',
                  style: TextStyles.textStyleRegular
                      .copyWith(fontSize: 14.sp, color: AppColors.n900Black)),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('Duration',
                  style: TextStyles.textStyleRegular
                      .copyWith(fontSize: 14.sp, height: 2)),
            ),
            TableCell(
              child: Text('Workout',
                  style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp)),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text('1.2 Hours',
                  style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp, color: AppColors.n900Black, height: 2)),
            ),
            TableCell(
              child: Text('10',
                  style: TextStyles.textStyleRegular
                      .copyWith(fontSize: 14.sp, color: AppColors.n900Black)),
            ),
          ],
        ),
      ],
    );
  }
}
