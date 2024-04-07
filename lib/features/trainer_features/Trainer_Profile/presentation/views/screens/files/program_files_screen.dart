import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../core/widgets/custom_app_bar_arrow_button.dart';
import '../../../../../trainer_preference/presentation/views/widgets/documents_picker.dart';

class ProgramFilesScreen extends StatelessWidget {
  const ProgramFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Program Files',
          style: TextStyles.textStyleSemiBold.copyWith(
            color: AppColors.n900Black,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        leading: CustomAppBarArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/image/Icon/done.svg')
          ),
        ],
      
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Upload program files for quick and easy access through the chat ',
                              style: TextStyles.textStyleSemiBold.copyWith(
                                color: AppColors.n900Black,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' (like Training Schedule, Fitness Assessment, GoalSetting).',
                              style: TextStyles.textStyleRegular.copyWith(
                                color: AppColors.n100Gray,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: const DocumentsPicker(),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height / 6.h,
                )
              ],
            ),
          ),
        ),
    );
  }
}