import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/complete_your_profile/presentation/views/widgets/countries.dart';
import 'package:forme_app/complete_your_profile/presentation/views/widgets/country_drobdown.dart';
import 'package:forme_app/complete_your_profile/presentation/views/widgets/dropdown_button_form_field.dart';
import 'package:forme_app/complete_your_profile/presentation/views/widgets/phone_number_with_state_code.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_auth_button.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_text_from_field.dart';

class CompleteProfileBody extends StatefulWidget {
  const CompleteProfileBody({super.key});

  @override
  State<CompleteProfileBody> createState() => _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends State<CompleteProfileBody> {
  var genderItems = ['Male', 'Female'];
  var countryItems = ['Egypt', 'USA','Iraq'];

  String genderValue = 'Male';
  String countryValue = 'Egypt';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          title: 'Name',
          hint: 'Enter Your Name',
          type: 'text',
          topPadding: 32.h,
          bottomPadding: 0,
        ),
        PhoneNumberWithStateCode(
          topPadding: 16.h,
        ),

        DrobDownMenuButton(
          dropDownValue: genderValue,
          dropDownItems: genderItems,
          onDropDownValueChanged: (newValue) {
            setState(() {
              genderValue = newValue;
            });
          },
          title: 'Gender',
        ),
        DrobDownMenuButton(
          dropDownValue: countryValue,
          dropDownItems: countries,
          onDropDownValueChanged: (newValue) {
            setState(() {
              countryValue = newValue;
            });
          },
          title: 'Country',
        ),
                
        Padding(
          padding: EdgeInsets.only(top: 32.0.h,bottom: 164.h),
          child: const CustomAuthButton(text: "Complete Profile", isActive: true),
        )
      ],
    );
  }
}
