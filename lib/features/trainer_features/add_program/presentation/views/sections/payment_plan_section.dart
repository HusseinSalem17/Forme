import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class PaymentPlanItem extends StatefulWidget {
  final void Function()? onTap;
  const PaymentPlanItem({super.key, required this.onTap});

  @override
  State<PaymentPlanItem> createState() => _PaymentPlanItemState();
}

class _PaymentPlanItemState extends State<PaymentPlanItem> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late TextEditingController _firstController;
  late TextEditingController _secondController;

  bool _isChecked = false;
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customNumberField(
                _firstFocusNode,
                _firstController,
                context,
                'Duration (weeks)',
                (MediaQuery.sizeOf(context).width / 2.7),
              ),
              customNumberField(_secondFocusNode, _secondController, context,
                  'Price (EGP)', (MediaQuery.sizeOf(context).width / 2.7)),
              GestureDetector(
                onTap: widget.onTap,
                child: SvgPicture.asset(
                  'assets/image/Icon/delete.svg',
                  width: 16.h,
                ),
              )
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Offer",
                      style: TextStyles.textStyleRegular.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.n200BodyContentColor)),
                  Checkbox(
                    value: _isChecked,
                    activeColor: AppColors.primaryColor,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
              Visibility(
                visible: _isChecked,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customNumberField(
                        FocusNode(),
                        TextEditingController(),
                        context,
                        'Max Clients',
                        (MediaQuery.sizeOf(context).width / 2.8),
                      ),
                      customNumberField(
                          FocusNode(),
                          TextEditingController(),
                          context,
                          'Offer Price (EGP)',
                          (MediaQuery.sizeOf(context).width / 2.8)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container customNumberField(
      FocusNode focusNode,
      TextEditingController controller,
      BuildContext context,
      String title,
      double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.n40Gray,
          ),
          borderRadius: BorderRadius.circular(4.dg),
          color: AppColors.background),
      margin: EdgeInsets.only(bottom: 4.h),
      padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyles.textStyleRegular.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.n200Gray,
                  height: 1)),
          TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: TextStyles.textStyleRegular.copyWith(
                  fontSize: 12.sp, color: AppColors.n200Gray),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: textFieldBorder(
                color: AppColors.r200ErrorColor,
                width: 2.0,
              ),
            ),
            onChanged: (value) {
              debugPrint(value);
            },
          ),
        ],
      ),
    );
  }
}
