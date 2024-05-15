// complete_profile_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/header_text.dart';
import 'package:forme_app/features/trainer_features/complete_profile_trainer/presentation/manager/cubit/trainer_complete_profile_cubit.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/complete_profile_widgets/custom_primary_button.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/complete_profile_widgets/profile_image_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/trainer_complete_profile_data.dart';
import 'trainer_body_fields.dart';

class TrainerCompleteProfileBody extends StatefulWidget {
  const TrainerCompleteProfileBody({Key? key}) : super(key: key);

  @override
  State<TrainerCompleteProfileBody> createState() =>
      _TrainerCompleteProfileBodyState();
}

class _TrainerCompleteProfileBodyState
    extends State<TrainerCompleteProfileBody> {
  String? name, phone, gender, country, sportFields;
  XFile? _imageFile;
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
        // ... (unchanged)
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            scrollDirection: Axis.vertical,
            children: [
              // const HeaderText(
              //   title: 'Complete Your Profile',
              //   subtitle:
              //   'Don’t worry, only you can see your personal data. No one else will be able to see it.',
              // ),
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
              buildTrainerBodyFields(
                name: name,
                phone: phone,
                gender: gender,
                country: country,
                sportFields: sportFields,
                onNameChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                onPhoneChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
                onGenderChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                onCountryChanged: (value) {
                  setState(() {
                    country = value;
                  });
                },
                onSportFieldChanged: (value) {
                  setState(() {});
                },
              ),
              SizedBox(height: 32.0.h),
              CustomPrimaryButton(
                text: 'Complete Profile',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TrainerCompleteProfileData data = TrainerCompleteProfileData(
                    //   name: name!,
                    //   gender: gender!,
                    //   country: country!,
                    //   phone: phone!,
                    //   sportField: sportFields!,
                    // );
                    // BlocProvider.of<TrainerCompleteProfileCubit>(context).handleTrainerCompleteProfile(data: data);
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
