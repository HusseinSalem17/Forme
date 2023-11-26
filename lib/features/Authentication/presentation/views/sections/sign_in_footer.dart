import 'package:flutter/material.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/custom_button.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(iconUrl: "Group",),
        CustomButton(iconUrl: "Vector",)
      ],
    );
  }
}
