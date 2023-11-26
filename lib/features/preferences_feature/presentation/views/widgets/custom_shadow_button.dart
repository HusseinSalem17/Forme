import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/preferences_feature/presentation/manager/preferences_bloc.dart';


class CustomShadowButton extends StatelessWidget {
  final PageController pageViewController;

  const CustomShadowButton({
    super.key,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 8,
            blurRadius: 6,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 24,
            right: 24,
            bottom: 36,
          ),
          child: InkWell(
            onTap: () {
              // Handle button press
              pageViewController.animateToPage(
                BlocProvider.of<PreferencesBloc>(context).state.page + 1,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeIn,
              );
            },
            splashColor: Colors.grey.withOpacity(1), // Add a splash color
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.p300PrimaryColor,
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
