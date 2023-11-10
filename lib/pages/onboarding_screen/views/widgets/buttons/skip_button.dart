import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/pages/page_after_onboarding.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const PageAfterOnBoarding()));
          },
          child: const Text("Skip", style: Styles.kDescriptionStyle),
        ),
      ],
    );
  }
}
