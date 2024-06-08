import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/featured/presentation/widgets/filter_type.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/widgets/custom_expansion_tile.dart';

class ContactUsTab extends StatelessWidget {
  final List<String> filterTypes;
  const ContactUsTab({super.key, required this.filterTypes});

  @override
  Widget build(BuildContext context) {
    final List<String> contacts = [
      'Customer Service',
      'WhatsApp',
      'Website',
      'Facebook',
      'Twitter',
      'Instagram',
    ];
    final List<String> answers = [
      'Lorem ipsum dolor sit amet consectetur.',
      '(+20)01224822101',
      'forme.com',
      'facebook.com',
      'Twitter.com',
      'instagram.com',
    ];
    final List<String> icons = [
      'customer-service',
      'whats-app',
      'website',
      'facebook',
      'twitter',
      'instagram',
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(
                  filterTypes.length,
                  (int index) {
                    return filterType(filterTypes[index]);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
                children: List<Widget>.generate(contacts.length, (int index) {
              return customExpansionTile(
                  Row(
                    children: [
                      SvgPicture.asset(
                          'assets/image/profile/${icons[index]}.svg'),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(contacts[index],
                          style: TextStyles.textStyleBold.copyWith(
                              fontSize: 14.sp, color: AppColors.n900Black)),
                    ],
                  ),
                  answers[index]);
            })),
          ),
        ],
      ),
    );
  }
}
