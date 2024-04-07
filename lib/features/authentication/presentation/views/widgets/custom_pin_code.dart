import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
    required this.context,
    required this.otpFiledController,
  });

  final BuildContext context;
  final TextEditingController otpFiledController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      cursorColor: AppColors.n100Gray,
      animationCurve: Curves.bounceIn,
      animationType: AnimationType.scale,
      appContext: context,
      length: 4,
      enableActiveFill: true,
      controller: otpFiledController,
      keyboardType: TextInputType.number,
      textStyle: const TextStyle(
        color: Colors.black,
      ),
      hintCharacter: '-',
      onChanged: (value) {
        // handle the OTP input
        debugPrint(value);
      },
      onCompleted: (value) {
        // handle the completed OTP
        debugPrint("Completed: $value");
      },
      pinTheme: PinTheme(
        borderRadius: BorderRadius.circular(10.r),
        shape: PinCodeFieldShape.box,
        fieldHeight: 50.h,
        fieldWidth: 73.5.w,
        borderWidth: 0.w,
        activeColor: AppColors.n20FillBodyInSmallCardColor,
        inactiveColor: AppColors.n20FillBodyInSmallCardColor,
        activeFillColor: AppColors.n20FillBodyInSmallCardColor,
        selectedFillColor: AppColors.n20FillBodyInSmallCardColor,
        inactiveFillColor: AppColors.n20FillBodyInSmallCardColor,
      ),
    );
  }
}
