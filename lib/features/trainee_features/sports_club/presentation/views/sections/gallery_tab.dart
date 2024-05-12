import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: Text(
                  'Gallery ',
                  style: TextStyles.textStyleBold.copyWith(
                      fontSize: 14.sp, color: AppColors.n900Black),
                ),
              ),
              Text(
                '(6)',
                style: TextStyles.textStyleBold.copyWith(
                    fontSize: 14.sp, color: AppColors.primaryColor),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(8.dg),
                  child: Image.asset(
                    'assets/image/temp/Frame$index.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }
}
