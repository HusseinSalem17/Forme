// body_fields.dart
import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import '../../../../../../core/widgets/app_drop_list/custom_drop_list.dart';
import '../../../../../../core/widgets/app_fields/custom_phone_field.dart';
import '../../../../../../core/widgets/app_fields/custom_text_field.dart';

Widget buildTraineeBodyFields({
  required ValueChanged<String> onNameChanged,
  required ValueChanged<String> onPhoneChanged,
  required ValueChanged<String> onGenderChanged,
  required ValueChanged<String> onCountryChanged,
}) {
  final List<String> genderItems = ['male', 'female'];
  final List<String> countryItems = ['Egypt', 'USA'];

  return Column(
    children: [
      //! name
      CustomTextField(
        title: 'Full Name',
         hintStyle: TextStyles.hintStyle,
        hintText: 'Hussein Salem Eldeskey',
        keyboardType: TextInputType.name,
        onChanged: onNameChanged,
      ),
      SizedBox(height: 16.h),
      //! number
      CustomPhoneField(
        title: 'Phone Number',
        initialCountry: 'EG',
        optional: true,
        allowPickFromContacts: false,
        countryListMode: CountryListMode.dialog,
        showSelectedFlag: false,
        border: textFieldBorder(),
        onChanged: onPhoneChanged,
      ),
      SizedBox(height: 16.h),
      //! gender
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
      //! country
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
