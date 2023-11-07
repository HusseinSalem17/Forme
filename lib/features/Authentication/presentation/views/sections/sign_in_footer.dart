import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.background,
            child: SvgPicture.asset("assets/image/Icon/Vector.svg")),
        FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.background,
            child: SvgPicture.asset("assets/image/Icon/Group.svg")),
      ],
    );
  }
}
