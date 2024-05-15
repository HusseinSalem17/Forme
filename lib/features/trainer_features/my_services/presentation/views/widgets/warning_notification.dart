import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class WarningNotification extends StatelessWidget {
  const WarningNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.w50Warning,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.w75Warning,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/image/Icon/danger.svg'),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Set up a payment method for trainees to \nsend payments and show your programs \nand workouts in the app effortlessly.',
              style: TextStyles.textStyleRegular.copyWith(
                  color: AppColors.n400color,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.chevronRight,
                  color: AppColors.n900Black,
                  size: 18,
                ))
          ],
        ),
      ),
    );
  }
}
