import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../manager/preferences_bloc.dart';

class CustomAppBarArrowButton extends StatelessWidget {
  final PageController pageViewController;

  const CustomAppBarArrowButton({
    super.key,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Container(
        width: 32.h,
        height: 32.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.n50dropShadowColor.withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
          size: 20,
        ),
      ),
      onPressed: () {
        pageViewController.animateToPage(
          BlocProvider.of<PreferencesBloc>(context).state.page - 1,
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
