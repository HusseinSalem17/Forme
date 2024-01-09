import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/featured/presentation/widgets/filter_type.dart';
import 'package:forme_app/features/profile/presentation/widgets/custom_expansion_tile.dart';

class FAQsTab extends StatelessWidget {
  final List<String> filterTypes;
  const FAQsTab({super.key, required this.filterTypes});

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'Are the workouts suitable for beginners?',
      'What is the refund policy?',
      'How can i cancel my premium subscription?',
      'How do i reset my password if i forget it?',
      'How do i receive updates and notifications?',
      'How to add review?',
      'What is the difference between workout and program',
      'Is Voice call or Video Call Feature there?',
    ];
    final List<String> answers = [
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
      'Lorem ipsum dolor sit amet consectetur. Ut non vitae eu morbi purus a consectetur morbi. Etiam neque id mi leo diam.',
    ];
    return SingleChildScrollView(
      child: Column(children: [
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
              children: List<Widget>.generate(questions.length, (int index) {
            return customExpansionTile(
                Text(questions[index],
                    style: TextStyles.textStyleBold.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.n900PrimaryTextColor)),
                answers[index]);
          })),
        ),
      ]),
    );
  }

  
}
