import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class CountryDropDown extends StatefulWidget {
  final double topPadding, bottomPadding;
  final String title;
  const CountryDropDown(
      {super.key,
      this.topPadding = 4.0,
      this.bottomPadding = 4.0,
      required this.title});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.topPadding.h,
        bottom: widget.bottomPadding.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10.0.h,
            ),
            child: Text(
              widget.title,
              textAlign: TextAlign.start,
              style: Styles.textStyleBold14.copyWith(
                color: AppColors.n900PrimaryTextColor,
              ),
            ),
          ),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.n900PrimaryTextColor,
              ),
              borderRadius: BorderRadius.circular(4.dg),
            ),
            child: SizedBox(
              width: 342.w,
              // height: 65.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CSCPicker(
                  onCountryChanged: (String country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                  dropdownHeadingStyle: Styles.headerStyle,
                  dropdownItemStyle: const TextStyle(
                      color: AppColors.n900PrimaryTextColor, fontSize: 16),
                  selectedItemStyle: const TextStyle(
                      color: AppColors.n900PrimaryTextColor, fontSize: 16),
                  currentCountry: "Egypt",
                  showStates: false,
                  showCities: false,
                  flagState: CountryFlag.DISABLE,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
