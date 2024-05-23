import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';

void customSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: AppColors.d500Danger,
        content: Text(content),
      ),
    );
}
