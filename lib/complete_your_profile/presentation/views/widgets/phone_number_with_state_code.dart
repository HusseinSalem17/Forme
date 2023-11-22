import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class PhoneNumberWithStateCode extends StatefulWidget {
  final double topPadding, bottomPadding;
  const PhoneNumberWithStateCode(
      {super.key, this.bottomPadding = 0, this.topPadding = 4.0});

  @override
  State<PhoneNumberWithStateCode> createState() =>
      _PhoneNumberWithStateCodeState();
}

class _PhoneNumberWithStateCodeState extends State<PhoneNumberWithStateCode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.topPadding.h, bottom: widget.bottomPadding.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.0.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone Number",
                  textAlign: TextAlign.start,
                  style: Styles.textStyleBold14
                      .copyWith(color: AppColors.n900PrimaryTextColor),
                ),
                const Text(
                  "(optional)",
                  style: Styles.textStyleRegular10,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: AppColors.n900PrimaryTextColor),
              borderRadius: BorderRadius.circular(4.dg),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 80.w,
                  child: CountryCodePicker(
                    showDropDownButton: false,
                    onChanged: print,
                    initialSelection: 'EG',
                    favorite: const ['+20'],
                    textStyle: Styles.textStyleMedium10
                        .copyWith(color: AppColors.n900PrimaryTextColor),
                    searchDecoration: const InputDecoration(
                      hintText: "Enter Phone Number",
                      hintStyle: Styles.hintStyle,
                      border: InputBorder.none,
                    ),
                    showFlag: false,
                    showFlagDialog: true,
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: true,
                  ),
                ),
                Text("|",
                    style: Styles.hintStyle.copyWith(
                        fontSize: 14, color: AppColors.n40BorderColor)),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 215.w,
                  height: 44.h,
                  child: TextFormField(
                    cursorColor: AppColors.p300PrimaryColor,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter Phone Number",
                      hintStyle: Styles.hintStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
