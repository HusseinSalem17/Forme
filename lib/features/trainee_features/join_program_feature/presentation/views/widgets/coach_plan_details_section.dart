import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:ionicons/ionicons.dart';
import 'build_table.dart';

class CoachPlanDetailsSection extends StatelessWidget {
  const CoachPlanDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(
            '\$20',
            style: TextStyles.heading4Bold.copyWith(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text('Online Coaching',
              style: TextStyles.heading4Bold.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Created At 17 Jul 2023',
            style: TextStyles.textStyleRegular.copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTable().buildTable(),
          SizedBox(
            height: 24.h,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.n30StrokeColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/image/m.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kareem Muhamed',
                          style: TextStyles.textStyleRegular.copyWith(
                            color: AppColors.n900Black,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'GYM Owner',
                          style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    buildContainerBackgroundIcon(Ionicons.chatbubble_ellipses),
                    SizedBox(
                      width: 16.w,
                    ),
                    buildContainerBackgroundIcon(Ionicons.call),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.n30StrokeColor,
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuereLorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuereLorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere',
              style: TextStyles.textStyleRegular.copyWith(fontSize: 12),
              maxLines: 6,
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/image/Icon/plans_icon.svg',
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                'Payment Plans',
                style: TextStyles.descriptionStyle.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.n900Black),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }

  Container buildContainerBackgroundIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.n20Gray),
      child: Icon(
        icon,
        color: AppColors.primaryColor,
      ),
    );
  }
}
