import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/sports_club/data/models/club_icon_model.dart';
import 'package:forme_app/features/sports_club/presentation/views/widgets&methods/club_icon.dart';

Center facilitiesSection() {
    return Center(
      child: Wrap(
        spacing: 16.0.h,
        runSpacing: 8.0.h,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List<Widget>.generate(
          clubIconData.length,
          (int index) {
            return clubIcon(clubIconData[index]);
          },
        ),
      ),
    );
  }