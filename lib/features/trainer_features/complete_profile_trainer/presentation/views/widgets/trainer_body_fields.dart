// body_fields.dart
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/widgets/app_fields/custom_phone_field.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/features/user_features/profile/presentation/views/complete_profile_widgets/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/app_drop_list/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_phone_field.dart';

Widget buildTrainerBodyFields({
  required String? name,
  required String? phone,
  required String? gender,
  required String? country,
  required String? sportFields,
  required ValueChanged<String> onNameChanged,
  required ValueChanged<String> onPhoneChanged,
  required ValueChanged<String> onGenderChanged,
  required ValueChanged<String> onCountryChanged,
  required ValueChanged<String> onSportFieldChanged,
}) {
  final List<String> genderItems = ['Male', 'Female'];
  final List<String> countryItems = ['Egypt', 'USA'];
  final List<String> sportFieldItems = ['Fitness', 'Football', 'Tennis', 'Swimming', 'Basketball', 'Volleyball', 'Handball', 'Running', 'Cycling', 'Boxing', 'Yoga', 'Pilates', 'Dancing', 'Golf', 'Horse Riding', 'Skiing', 'Skating', 'Surfing', 'Sailing', 'Bowling', 'Billiards', 'Chess', 'Shooting'];

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
          color: AppColors.p300PrimaryColor,
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
      SizedBox(height: 16.h),
      CustomDropList(
        title: "Sport Field",
        hint: const Text('Select Sport Field'),
        items: sportFieldItems
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select sport field.';
          }
          return null;
        },
        onChanged: (value) {
          onSportFieldChanged(value ?? '');
        },
        onSaved: (value) {},
      ),
    ],
  );
}
