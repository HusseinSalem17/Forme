import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import '../../manager/complete_profile_cubit/complete_profile_cubit.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
          builder: (context, state) {
            return state is CompleteProfileLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyles.textStyleMedium.copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
