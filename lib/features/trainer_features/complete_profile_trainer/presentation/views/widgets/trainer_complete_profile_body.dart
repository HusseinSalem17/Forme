// complete_profile_body.dart
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';
import 'package:forme_app/core/widgets/flutter_toast.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/manager/cubit/trainer_complete_profile_cubit.dart';

import '../../../../../../core/widgets/image_picker/profile_image_picker.dart';
import 'trainer_body_fields.dart';

class TrainerCompleteProfileBody extends StatefulWidget {
  const TrainerCompleteProfileBody({Key? key}) : super(key: key);

  @override
  State<TrainerCompleteProfileBody> createState() =>
      _TrainerCompleteProfileBodyState();
}

class _TrainerCompleteProfileBodyState
    extends State<TrainerCompleteProfileBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late PhoneNumberInputController phoneNumberController;
  late TextEditingController fullNameController;
  late ValueNotifier<String?> genderNotifier;
  late ValueNotifier<String?> countryNotifier;
  late ValueNotifier<String?> sportFieldNotifier;

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
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrainerCompleteProfileCubit,
        TrainerCompleteProfileState>(
      listener: (context, state) {
        if (state is TrainerCompleteProfileSuccess) {
          // Navigator.of(context)
          //     .pushReplacement(PageSlideTransition(const TrainerHomeScreen()));
        } else if (state is TrainerCompleteProfileFailure) {
          showCustomSnackbar(
              context,
              "Network problem. Please check your internet connection and try again.",
              AppColors.w75Color,
              1);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
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
                              height: 3)),
                      TextSpan(
                          text:
                              '\nDon’t worry, only you can see your personal data. No one else will be able to see it.',
                          style: TextStyles.textStyleRegular
                              .copyWith(fontSize: 14.sp)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0.h),
              //! picker image
              ProfileImagePicker(
                enabled: true,
                imageFile: context.read<TrainerCompleteProfileCubit>().image,
                onImageSelected: (file) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().image = file;
                  });
                },
              ),
              SizedBox(height: 32.0.h),
              buildTrainerBodyFields(
                // onNameChanged: fullNameController,
                // onPhoneChanged: phoneNumberController,
                // genderNotifier: null,
                // onBrithChanged: (String value) {},
                // countryNotifier: null,
                // sprotFieldNotifier: null,
              ),
              SizedBox(height: 32.0.h),
              CustomAppButton(
                title: 'Complete Profile',
                isLoad: state is TrainerCompleteProfileLoading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<TrainerCompleteProfileCubit>(context)
                        .patchTrainerCompleteProfile();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
