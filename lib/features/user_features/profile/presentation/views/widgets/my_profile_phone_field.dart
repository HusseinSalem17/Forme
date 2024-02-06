import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_botton.dart';
import 'package:forme_app/core/widgets/second_custom_app_botton.dart';
import 'package:forme_app/core/widgets/app_fields/custom_phone_field.dart';

class MyProfilePhoneField extends StatelessWidget {
  const MyProfilePhoneField({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    String newPhone;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number',
            style: TextStyles.textStyleBold.copyWith(
                fontSize: 14.sp, color: AppColors.n900PrimaryTextColor)),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
              color: AppColors.fillColor,
              borderRadius: BorderRadius.circular(4.dg),
              border: Border.all(width: 1, color: AppColors.n40BorderColor)),
          padding: EdgeInsets.all(12.h),
          child: Row(children: [
            Text(
              phone,
              style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 14.sp, color: AppColors.n900PrimaryTextColor),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: AppColors.background,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    context: context,
                    builder: (context) {
                      return Container(
                          height: MediaQuery.sizeOf(context).height / 4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.dg),
                                  topRight: Radius.circular(20.dg))),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 24.h),
                          child: Column(
                            children: [
                              Text(
                                'Add Your New Number',
                                textAlign: TextAlign.center,
                                style: TextStyles.textStyleMedium.copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.n900PrimaryTextColor),
                              ),
                              const Divider(
                                color: AppColors.n30StrokeColor,
                                thickness: 1,
                              ),
                              CustomPhoneField(
                                  title: '',
                                  titleVisibility: false,
                                  initialCountry: 'EG',
                                  optional: false,
                                  allowPickFromContacts: false,
                                  countryListMode: CountryListMode.dialog,
                                  showSelectedFlag: false,
                                  border: textFieldBorder(),
                                  enabledBorder: textFieldBorder(),
                                  focusedBorder: textFieldBorder(
                                    color: AppColors.p300PrimaryColor,
                                    width: 2.0,
                                  ),
                                  errorBorder: textFieldBorder(
                                    color: AppColors.r200ErrorColor,
                                    width: 2.0,
                                  ),
                                  onChanged: (value) {
                                    newPhone = value;
                                  }),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SecondCustomAppBottom(
                                    title: 'Cancel',
                                    widthDivider: 2.2,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CustomAppBottom(
                                    title: 'Change',
                                    widthDivider: 2.2,
                                    color: AppColors.p300PrimaryColor,
                                    height: 40,
                                    fontSize: 14,
                                    padding: 0,
                                    onTap: () {
                                      //send new phone to API
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ));
                    });
              },
              child: Text(
                'Change',
                style: TextStyles.textStyleRegular.copyWith(
                    fontSize: 14.sp, color: AppColors.p300PrimaryColor),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
