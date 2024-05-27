import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class TwoChoices extends StatefulWidget {
  final String option1Text;
  final String option2Text;
  final bool showIcon;
  final bool allowMultiChoice;
  final TwoChoicesController controller;

  const TwoChoices({
    super.key,
    required this.option1Text,
    required this.option2Text,
    this.showIcon = false,
    this.allowMultiChoice = false,
    required this.controller,
  });

  @override
  State<TwoChoices> createState() => _TwoChoicesState();
}

class _TwoChoicesState extends State<TwoChoices> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateState);
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: widget.allowMultiChoice
                  ? widget.controller.multiChoiceOption1 == 1
                      ? AppColors.p50PrimaryColor
                      : AppColors.background
                  : widget.controller.selectedOption == 1
                      ? AppColors.p50PrimaryColor
                      : AppColors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.allowMultiChoice
                    ? widget.controller.multiChoiceOption1 == 1
                        ? AppColors.primaryColor
                        : AppColors.n200Gray
                    : widget.controller.selectedOption == 1
                        ? AppColors.primaryColor
                        : AppColors.n200Gray,
              ),
            ),
            child: TextButton(
              onLongPress: () {
                if (widget.allowMultiChoice) {
                  widget.controller.resetMultiChoiceOption1();
                }
              },
              onPressed: () {
                widget.controller.selectOption(1);
                if (widget.allowMultiChoice) {
                  widget.controller.selectMultiChoiceOption1(1);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.showIcon
                      ? Icon(
                          Icons.male,
                          color: widget.allowMultiChoice
                              ? widget.controller.multiChoiceOption1 == 1
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray
                              : widget.controller.selectedOption == 1
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray,
                          size: 20.sp,
                        )
                      : Container(),
                  Text(
                    widget.option1Text,
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: widget.allowMultiChoice
                          ? widget.controller.multiChoiceOption1 == 1
                              ? AppColors.primaryColor
                              : AppColors.n200Gray
                          : widget.controller.selectedOption == 1
                              ? AppColors.primaryColor
                              : AppColors.n200Gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: widget.allowMultiChoice
                  ? widget.controller.multiChoiceOption2 == 1
                      ? AppColors.p50PrimaryColor
                      : AppColors.background
                  : widget.controller.selectedOption == 2
                      ? AppColors.p50PrimaryColor
                      : AppColors.background,
              border: Border.all(
                color: widget.allowMultiChoice
                    ? widget.controller.multiChoiceOption2 == 1
                        ? AppColors.primaryColor
                        : AppColors.n200Gray
                    : widget.controller.selectedOption == 2
                        ? AppColors.primaryColor
                        : AppColors.n200Gray,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onLongPress: () {
                if (widget.allowMultiChoice) {
                  widget.controller.resetMultiChoiceOption2();
                }
              },
              onPressed: () {
                widget.controller.selectOption(2);
                if (widget.allowMultiChoice) {
                  widget.controller.selectMultiChoiceOption2(1);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.showIcon
                      ? Icon(
                          Icons.female,
                          color: widget.allowMultiChoice
                              ? widget.controller.multiChoiceOption2 == 1
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray
                              : widget.controller.selectedOption == 2
                                  ? AppColors.primaryColor
                                  : AppColors.n200Gray,
                          size: 20.sp,
                        )
                      : Container(),
                  Text(
                    widget.option2Text,
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: widget.allowMultiChoice
                          ? widget.controller.multiChoiceOption2 == 1
                              ? AppColors.primaryColor
                              : AppColors.n200Gray
                          : widget.controller.selectedOption == 2
                              ? AppColors.primaryColor
                              : AppColors.n200Gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TwoChoicesController extends ChangeNotifier {
  int _selectedOption = 0;
  int _multiChoiceOption1 = 1;
  int _multiChoiceOption2 = 2;

  int get selectedOption => _selectedOption;
  int get multiChoiceOption1 => _multiChoiceOption1;
  int get multiChoiceOption2 => _multiChoiceOption2;

  void selectOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }

  int getOption() =>_selectedOption;
  

  void selectMultiChoiceOption1(int value) {
    _multiChoiceOption1 = value;
    notifyListeners();
  }

  void selectMultiChoiceOption2(int value) {
    _multiChoiceOption2 = value;
    notifyListeners();
  }

  void resetMultiChoiceOption1() {
    _multiChoiceOption1 = 0;
    notifyListeners();
  }

  void resetMultiChoiceOption2() {
    _multiChoiceOption2 = 0;
    notifyListeners();
  }
}
