import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainee_features/complete_profile_trainee/presentation/views/widgets/trainee_body_fields.dart';
import 'package:image_picker/image_picker.dart';

import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_button.dart';
import '../../../../../../core/widgets/image_picker/profile_image_picker.dart';
import '../../../data/models/trainee_complete_profile_data_model.dart';
import '../../manager/trainee_complete_profile_bloc.dart';

class TraineeCompleteProfileBody extends StatelessWidget {
  const TraineeCompleteProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TraineeCompleteProfileBloc(),
      child: const TraineeCompleteProfileForm(),
    );
  }
}

class TraineeCompleteProfileForm extends StatefulWidget {
  const TraineeCompleteProfileForm({super.key});

  @override
  TraineeCompleteProfileFormState createState() => TraineeCompleteProfileFormState();
}

class TraineeCompleteProfileFormState extends State<TraineeCompleteProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageFile;
  String? imageBase64;
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
                    text: '\nDon’t worry, only you can see your personal data. No one else will be able to see it.',
                    style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          BlocBuilder<TraineeCompleteProfileBloc, TraineeCompleteProfileState>(
            builder: (context, state) {
              if (state is ImagePickedSuccess) {
                imageFile = state.image;
                imageBase64 = state.imageBase64;
              }

              return ProfileImagePicker(
                imageFile: imageFile,
                onImageSelected: (file) {
                  context.read<TraineeCompleteProfileBloc>().add(ImagePicked(file!));
                },
              );
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

                TraineeCompleteProfileDataModel data = TraineeCompleteProfileDataModel(
                  username: fullNameController.text,
                  country: countryNotifier.value!,
                  gender: genderNotifier.value!,
                  phoneNumber: phoneNumberController.fullPhoneNumber,
                  profilePicture: imageBase64,
                );

                context.read<TraineeCompleteProfileBloc>().add(UpdateTraineeProfile(data));
              }
            },
          ),
        ],
      ),
    );
  }
}
