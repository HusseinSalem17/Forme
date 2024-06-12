import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';

import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/views/widgets/trainee_body_fields.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/widgets/image_picker/profile_image_picker.dart';

class TraineeCompleteProfileBody extends StatefulWidget {
  const TraineeCompleteProfileBody({Key? key}) : super(key: key);

  @override
  State<TraineeCompleteProfileBody> createState() =>
      _TraineeCompleteProfileBodyState();
}

class _TraineeCompleteProfileBodyState
    extends State<TraineeCompleteProfileBody> {
  XFile? _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late PhoneNumberInputController phoneNumberController;
  late TextEditingController fullNameController;
  late ValueNotifier<String?> genderNotifier;
  late ValueNotifier<String?> countryNotifier;

  @override
  void initState() {
    phoneNumberController = PhoneNumberInputController(context);
    fullNameController = TextEditingController();
    genderNotifier = ValueNotifier<String?>(null);
    countryNotifier = ValueNotifier<String?>(null);

    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    fullNameController.dispose();
    genderNotifier.dispose();
    countryNotifier.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Complete Your Profile',
                    style: TextStyles.textStyleBold.copyWith(
                      color: AppColors.n900Black,
                      fontSize: 20.sp,
                      height: 3,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\nDon’t worry, only you can see your personal data. No one else will be able to see it.',
                    style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          ProfileImagePicker(
            imageFile: _imageFile,
            onImageSelected: (file) {
              setState(() {
                _imageFile = file;
              });
            },
          ),
          SizedBox(height: 32.0.h),
          TraineeBodyFields(
            phoneNumberController: phoneNumberController,
            fullNameController: fullNameController,
            genderNotifier: genderNotifier,
            countryNotifier: countryNotifier,
          ),
          SizedBox(height: 32.0.h),
          CustomAppButton(
            title: 'Complete Profile',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                print(fullNameController.text);
                print(genderNotifier.value);
                print(countryNotifier.value);
                print(phoneNumberController.fullPhoneNumber);
              }
            },
          ),
        ],
      ),
    );
  }
}
