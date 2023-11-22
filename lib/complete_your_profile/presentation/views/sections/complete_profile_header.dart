import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/complete_your_profile/presentation/views/widgets/image_user_profile.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/Authentication/presentation/views/widgets/header_text.dart';

class CompleteProfileHeader extends StatelessWidget {
  final String header, description;
  const CompleteProfileHeader(
      {super.key, required this.header, required this.description});

  @override


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         HeaderText(title: header, subtitle: description),
        const ImageUserProfile()
      ],
    );
  }
}
