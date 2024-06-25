import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import '../../../../../../core/widgets/app_drop_list/custom_drop_list.dart';
import '../../../../../../core/widgets/app_fields/custom_phone_field.dart';
import '../../../../../../core/widgets/app_fields/custom_text_form_field.dart';

class TraineeBodyFields extends StatelessWidget {
  final PhoneNumberInputController phoneNumberController;
  final TextEditingController fullNameController;
  final ValueNotifier<String?> genderNotifier;
  final ValueNotifier<String?> countryNotifier;

  const TraineeBodyFields({
    super.key,
    required this.phoneNumberController,
    required this.fullNameController,
    required this.genderNotifier,
    required this.countryNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromField(
          hintText: 'Kareem',
          subTitle: 'Full Name',
          textEditingController: fullNameController,
          textInputType: TextInputType.name,
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
          controller: phoneNumberController,
        ),
        SizedBox(height: 16.h),
        CustomDropList(
          title: "Gender",
          hint: const Text('Select Your Gender'),
          items: ['male', 'female']
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
          onChanged: (value) {},
          selectedValueNotifier: genderNotifier, // Add this line
        ),
        SizedBox(height: 16.h),
        CustomDropList(
          title: "Country",
          hint: const Text('Select Country'),
          items: ['Egypt', 'USA']
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
          onChanged: (value) {},
          onSaved: (value) {},
          selectedValueNotifier: countryNotifier, // Add this line
        ),
      ],
    );
  }
}
