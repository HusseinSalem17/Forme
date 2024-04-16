import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/subscriptions/data/clients_subscriptions_cards_model.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/widgets/custom_clip_rect.dart';


class ClientsSubscriptionsCard extends StatelessWidget {
  const ClientsSubscriptionsCard({super.key, required this.size, required this.model});
  final Size size;
  final ClientsSubscriptionsCardsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.n10Color,
        ),
      child: Padding(
        padding: EdgeInsets.all(8.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Center(child: CustomClipRect(height: 58, width: 58, imagePath: 'assets/image/workout_image.jpg')),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.clientName,
                      style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n900Black),
                    ),
                    Row(
                      children: [
                        Text(
                          model.subscriptionType,
                          style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 11.sp,
                            color: AppColors.p200PrimaryColor
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                          child: Container(
                            width: 1.w,
                            height: 12.h,
                            color: AppColors.n80NavColor,
                          ),
                        ),
                        Text(
                          model.subscriptionDate,
                          style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 11.sp,
                            color: AppColors.n80NavColor
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.n100Gray,
                  ),
                  color: AppColors.background,
                  surfaceTintColor: Colors.transparent,
                  position: PopupMenuPosition.under,
                  constraints: const BoxConstraints(
                    minWidth: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      height: 35,
                      child: Text(
                        'Message',
                      ),
                    ),
                    const PopupMenuItem(
                      height: 35,
                      child: Text(
                        'View Profile',
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
