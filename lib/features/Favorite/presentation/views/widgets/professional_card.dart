import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class ProfessionalCard extends StatelessWidget {
  const ProfessionalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.fillColor,
                  ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  SvgPicture.asset('assets/image/Icon/verified.svg'),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text('Professional Trainer',
                      style:TextStyle(
                          fontSize: 11, color: AppColors.p300PrimaryColor)),
                ],
              ),
            );
  }
}