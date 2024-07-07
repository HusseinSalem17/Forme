import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';
import 'package:forme_app/core/widgets/second_custom_app_button.dart';

import '../../../../../../local_storage_data/auth_local/tokens.dart';
import '../../../../../../local_storage_data/auth_local/user_type.dart';
import '../../../../../Authentication/presentation/views/sign_in_screen.dart';

Future<dynamic> popUp(
    BuildContext context, String title, String text, String buttonTitle) {
  return showModalBottomSheet(
      backgroundColor: AppColors.background,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.sizeOf(context).height / 5,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.dg),
                    topRight: Radius.circular(20.dg))),
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.h),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleMedium
                      .copyWith(fontSize: 16.sp, color: AppColors.n900Black),
                ),
                const Divider(
                  color: AppColors.n30StrokeColor,
                  thickness: 1,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleRegular.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SecondCustomAppButton(
                    //   title: 'Cancel',
                    //   widthDivider: 2.2,
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    InkWell(
                      onTap: () {
                        RegistrationDataLocal.clearUserType();
                        UserTokenLocal.clearTokens();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                      },
                      child: CustomAppButton(
                        title: buttonTitle,
                        widthDivider: 2.2,
                        color: AppColors.d300Danger,
                        height: 30,
                        fontSize: 14,
                        padding: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ));
      });
}
