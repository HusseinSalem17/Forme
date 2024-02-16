import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class ProgramsCardType extends StatelessWidget {
  final String type, state;
  const ProgramsCardType({
    super.key,
    required this.type,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.n20FillBodyInSmallCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              type,
              style: TextStyles.cardTextStyle,
            ),
            Container(
              width: 0.5,
              height: 9,
              color: AppColors.p300PrimaryColor,
            ),
            Text(
              state,
              style: TextStyles.cardTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
