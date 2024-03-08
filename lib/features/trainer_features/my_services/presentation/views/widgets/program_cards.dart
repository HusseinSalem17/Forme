import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/user_features/Favorite/presentation/views/widgets/workout_card_type.dart';
import 'package:forme_app/features/user_features/home/presentation/views/widgets/card_review_section.dart';


class CardsItem extends StatelessWidget {
  CardsItem(
      {super.key, required this.isPrograms, required this.type, this.state = 'Online', this.videos = 17, required this.title, required this.clients,  this.duration = '', required this.price, required this.rating, required this.reviews});
  final bool isPrograms;
  String type, state, title, duration;
  double price, rating;
  int reviews, videos, clients;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: size.width / 2.25,
          height: size.height / 3.75,
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: AppColors.n50dropShadowColor.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 10,
                cornerSmoothing: 1,
              ),
            ),
            color: AppColors.background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: size.height / 3.75 / 2,
                  width: size.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/image/card_image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                isPrograms
                    ? CardReviewSection(
                        type: type,
                        state: state,
                        rating: rating,
                        review: reviews,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WorkoutCardType(
                            type: type,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: AppColors.starColor,
                              ),
                              Text(
                                '$rating ($reviews Reviews)',
                                style: TextStyles.cardTextStyle.copyWith(color: AppColors.n200BodyContentColor, fontSize: 9, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                Text(
                  title,
                  style: TextStyles.blackCardTextStyle,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/image/People.svg'),
                    const SizedBox(width: 6),
                    Text(
                      'Your Clients: ',
                      style: TextStyles.cardTextStyle.copyWith(
                        color: AppColors.n200BodyContentColor,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      '$clients clients',
                      style: TextStyles.cardTextStyle.copyWith(color: AppColors.p200PrimaryColor, fontSize: 11, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'E£$price',
                      style: TextStyles.cardTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    isPrograms
                        ? Text(
                            ' /$duration',
                            style: TextStyles.cardTextStyle.copyWith(
                              color: AppColors.n200BodyContentColor,
                              fontSize: 9,
                            ),
                          )
                        : Text(
                            ' /$videos videos',
                            style: TextStyles.cardTextStyle.copyWith(
                              color: AppColors.n200BodyContentColor,
                              fontSize: 9,
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
