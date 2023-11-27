import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/home_feature/widgets_of_home_screen/specila_programs_card_item.dart';

import '../../../core/utils/app_colors.dart';

class SpecialProgramsCardList extends StatelessWidget {
  const SpecialProgramsCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SpecialProgramsCardItem(size: size),
          );
        },
      ),
    );
  }
}
