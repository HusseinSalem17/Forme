
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TargetAgeSection extends StatefulWidget {
  const TargetAgeSection({
    super.key,
  });

  @override
  State<TargetAgeSection> createState() => _TargetAgeSectionState();
}

class _TargetAgeSectionState extends State<TargetAgeSection> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late TextEditingController _firstController;
  late TextEditingController _secondController;
  @override
  void initState() {
    super.initState();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _firstController = TextEditingController();
    _secondController = TextEditingController();

    _firstFocusNode.addListener(() {
      if (!_firstFocusNode.hasFocus && _firstController.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(_secondFocusNode);
      }
    });
    _secondController.addListener(() {
      if (_secondController.text.isNotEmpty) {
        final secondValue = int.tryParse(_secondController.text) ?? 0;
        final firstValue = int.tryParse(_firstController.text) ?? 0;
        if (firstValue >= secondValue) {
          // Update first field value to be less than second field value
          _firstController.text = (secondValue - 1).toString();
        }
      }
    });
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Enter Traget Age',
              style: TextStyles.textStyleBold
                  .copyWith(fontSize: 14.sp, color: AppColors.n400),
            ),
            Text(
              '(optional)',
              style: TextStyles.textStyleRegular
                  .copyWith(fontSize: 12.sp, color: AppColors.n400),
            ),
          ],
        ),
        Padding(

          padding: EdgeInsets.symmetric(vertical: 10.h),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customNumberField(_firstFocusNode, _firstController, context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SvgPicture.asset('assets/image/Icon/right_arrow.svg'),
              ),
              customNumberField(_secondFocusNode, _secondController, context),
            ],
          ),
        ),
      ],
    );
  }

  Expanded customNumberField(FocusNode focusNode,
      TextEditingController controller, BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(
            left: 0.w,
            top: 8.h,
            bottom: 8.h,
          ),
          hintText: '0',
          hintStyle: TextStyles.hintStyle,
          border: textFieldBorder(),
          enabledBorder: textFieldBorder(),
          focusedBorder: textFieldBorder(
            color: AppColors.p300PrimaryColor,
            width: 2.0,
          ),
          errorBorder: textFieldBorder(
            color: AppColors.r200ErrorColor,
            width: 2.0,
          ),
        ),
        onChanged: (value) {
          debugPrint(value);
        },

      ),
    );
  }
}
