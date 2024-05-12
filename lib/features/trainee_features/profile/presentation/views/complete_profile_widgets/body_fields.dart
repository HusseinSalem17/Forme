// body_fields.dart
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import '../../../../../../core/widgets/app_drop_list/custom_drop_list.dart';
import '../../../../../../core/widgets/app_fields/custom_phone_field.dart';
import '../../../../../../core/widgets/app_fields/custom_text_field.dart';

Widget buildBodyFields({
  required String? name,
  required String? phone,
  required String? gender,
  required String? country,
  required ValueChanged<String> onNameChanged,
  required ValueChanged<String> onPhoneChanged,
  required ValueChanged<String> onGenderChanged,
  required ValueChanged<String> onCountryChanged,
}) {
  final List<String> genderItems = ['Male', 'Female'];
  final List<String> countryItems = ['Egypt', 'USA'];

  return Column(
    children: [
      CustomTextField(
        title: 'Full Name',
        hintText: 'Hussein Salem Eldeskey',
        keyboardType: TextInputType.name,
        onChanged: onNameChanged,
      ),
      SizedBox(height: 16.h),
      CustomPhoneField(
        title: 'Phone Number',
        initialCountry: 'EG',
        optional: true,
        allowPickFromContacts: false,
        countryListMode: CountryListMode.dialog,
        showSelectedFlag: false,
        border: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        focusedBorder: textFieldBorder(
          color: AppColors.primaryColor,
          width: 2.0,
        ),
        errorBorder: textFieldBorder(
          color: AppColors.r200ErrorColor,
          width: 2.0,
        ),
        onChanged: onPhoneChanged,
      ),
      SizedBox(height: 16.h),
      CustomDropList(
        title: "Gender",
        hint: const Text('Select Your Gender'),
        items: genderItems
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        onChanged: (value) {
          onGenderChanged(value ?? '');
        },
      ),
      SizedBox(height: 16.h),
      CustomDropList(
        title: "Country",
        hint: const Text('Select Country'),
        items: countryItems
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select country.';
          }
          return null;
        },
        onChanged: (value) {
          onCountryChanged(value ?? '');
        },
        onSaved: (value) {},
      ),
    ],
  );
}
