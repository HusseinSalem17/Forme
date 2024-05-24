// complete_profile_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';
import 'package:forme_app/core/widgets/flutter_toast.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/manager/cubit/trainer_complete_profile_cubit.dart';
import 'package:forme_app/features/trainer_features/dashboard/presentation/views/dashboard_screen.dart';
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
          Navigator.of(context)
              .pushReplacement(PageSlideTransition(const DashboardScreen()));
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
              ProfileImagePicker(
                imageFile: context.read<TrainerCompleteProfileCubit>().image,
                onImageSelected: (file) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().image = file;
                  });
                },
              ),
              SizedBox(height: 32.0.h),
              buildTrainerBodyFields(
                onNameChanged: (value) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().name = value;
                  });
                },
                onPhoneChanged: (value) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().phone = value;
                  });
                },
                onGenderChanged: (value) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().gender = value;
                  });
                },
                onCountryChanged: (value) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().country = value;
                  });
                },
                onSportFieldChanged: (value) {
                  setState(() {
                    context.read<TrainerCompleteProfileCubit>().sportField =
                        value;
                  });
                },
              ),
              SizedBox(height: 32.0.h),
              CustomAppButton(
                title: 'Complete Profile',
                isLoad: state is TrainerCompleteProfileLoading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<TrainerCompleteProfileCubit>()
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
