import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/sections/vertical_list_of_items.dart';

class NearbySpotsClub extends StatelessWidget {
  final double listHeight;
  final void Function()? onTap;

  const NearbySpotsClub({
    super.key,
    this.listHeight = 3.5,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const VerticalCardsList();
        },
        childCount: 50,
      ),
    );
  }
}
