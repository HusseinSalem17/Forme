import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';

class SuccessStory extends StatelessWidget {
  static const routeName = '/success-story-screen';
  const SuccessStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(slivers: [
        SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 400.h,
            toolbarHeight: 110,
            backgroundColor: AppColors.background,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomAppBarArrowButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                Text(
                  'Success Story',
                  style: TextStyles.textStyleBold
                      .copyWith(fontSize: 18.sp, color: AppColors.background),
                ),
                const Spacer(),
                SizedBox(
                  width: 32.w,
                )
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/image/temp/Header1.png',
                    width: double.maxFinite, fit: BoxFit.cover)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.dg),
                      topRight: Radius.circular(15.dg),
                    )),
                padding: EdgeInsets.all(24.h),
                child: Text('Details',
                    style: TextStyles.textStyleMedium.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.n900PrimaryTextColor)),
              ),
            )),
        SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuereLorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuereLorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere Lorem ipsum dolor sit amet consectetur. Etiam morbi ut urna mi. Quis aliquam mattis consectetur varius a nunc id posuere ',
                  style: TextStyles.textStyleRegular
                      .copyWith(fontSize: 12.sp, color: AppColors.n600color),
                )))
      ])),
    );
  }
}
