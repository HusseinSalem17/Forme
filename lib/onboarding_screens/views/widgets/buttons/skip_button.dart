import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text("Skip", style: Styles.kDescriptionStyle),
        ),
      ],
    );
  }
}
