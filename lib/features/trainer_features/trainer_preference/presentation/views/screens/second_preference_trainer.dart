import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/documents_picker.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/id_image_picker.dart';

class SecondPreferenceTrainer extends StatefulWidget {
  const SecondPreferenceTrainer({super.key});

  @override
  State<SecondPreferenceTrainer> createState() =>
      _SecondPreferenceTrainerState();
}

class _SecondPreferenceTrainerState extends State<SecondPreferenceTrainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: BlocListener<TrainerPreferenceCubit, TrainerPreferenceState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 34.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          IdImagePicker(
                            imageFile:
                                context.read<TrainerPreferenceCubit>().idImage,
                            onImageSelected: (file) {
                              setState(() {
                                context.read<TrainerPreferenceCubit>().idImage =
                                    file;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'please upload your ID for verification',
                                style: TextStyles.textStyleSemiBold.copyWith(
                                  color: AppColors.n900Black,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\nThe uploaded ID will ot be display in your profile',
                                style: TextStyles.textStyleRegular.copyWith(
                                  color: AppColors.n200Gray,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Upload Documents For Verification ',
                          style: TextStyles.textStyleSemiBold.copyWith(
                            color: AppColors.n900Black,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: '(like Experience Certificate or course)',
                          style: TextStyles.textStyleRegular.copyWith(
                            color: AppColors.n100Gray,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const DocumentsPicker(),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<TrainerPreferenceCubit>()
                          .putTrainerPreferenceDocuments();
                    },
                    child: Container(
                      width: 100,
                      color: Colors.black,
                      height: MediaQuery.sizeOf(context).height / 6.h,
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height / 6.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
