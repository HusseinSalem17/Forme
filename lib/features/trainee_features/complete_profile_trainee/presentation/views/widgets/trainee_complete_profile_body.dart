// complete_profile_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';
import 'package:forme_app/core/widgets/flutter_toast.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/manager/cubit/trainee_complete_profile_cubit.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/views/widgets/trainee_body_fields.dart';

import '../../../../../../core/widgets/image_picker/profile_image_picker.dart';

class TraineeCompleteProfileBody extends StatefulWidget {
  const TraineeCompleteProfileBody({Key? key}) : super(key: key);

  @override
  State<TraineeCompleteProfileBody> createState() =>
      _TraineeCompleteProfileBodyState();
}

class _TraineeCompleteProfileBodyState
    extends State<TraineeCompleteProfileBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TraineeCompleteProfileCubit,
        TraineeCompleteProfileState>(
      listener: (context, state) {
        if (state is TraineeCompleteProfileSuccess) {
          toastInfo(msg: 'send and get response');
        } else if (state is TraineeCompleteProfileFailure) {
          toastInfo(msg: 'failuer#');
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
                imageFile: context.read<TraineeCompleteProfileCubit>().image,
                onImageSelected: (file) {
                  setState(() {
                    context.read<TraineeCompleteProfileCubit>().image = file;
                  });
                },
              ),
              SizedBox(height: 32.0.h),
              buildTraineeBodyFields(
                onNameChanged: (value) {
                  setState(() {
                    context.read<TraineeCompleteProfileCubit>().name = value;
                  });
                },
                onPhoneChanged: (value) {
                  setState(() {
                    context.read<TraineeCompleteProfileCubit>().phone = value;
                  });
                },
                onGenderChanged: (value) {
                  setState(() {
                    context.read<TraineeCompleteProfileCubit>().gender = value;
                  });
                },
                onCountryChanged: (value) {
                  setState(() {
                    context.read<TraineeCompleteProfileCubit>().country = value;
                  });
                },
              ),
              SizedBox(height: 32.0.h),
              CustomAppButton(
                title: 'Complete Profile',
                isLoad: state is TraineeCompleteProfileLoading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<TraineeCompleteProfileCubit>()
                        .postTraineeCompleteProfile();
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
