import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainer_features/subscriptions/data/your_clubs_cards_model.dart';

class RemoveFromCardSection extends StatelessWidget {
  const RemoveFromCardSection({super.key, required this.size, required this.model});
  final Size size;
  final YourClubsCardsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      height: size.height / 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height / 4,
              width: size.width / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'assets/image/workout_image.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    model.title,
                    style: TextStyles.textStyleSemiBold.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.n900PrimaryTextColor,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/pin-map.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          model.address,
                          style: TextStyles.cardTextStyle.copyWith(
                            color: AppColors.n100Color,
                            fontSize: 11.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/People.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          children: [
                            Text(
                              'Yous Clients: ',
                              style: TextStyles.textStyleRegular.copyWith(
                                color: AppColors.n100Color,
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              '${model.numClients} Clients',
                              style: TextStyles.textStyleBold.copyWith(
                                color: AppColors.p200PrimaryColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
