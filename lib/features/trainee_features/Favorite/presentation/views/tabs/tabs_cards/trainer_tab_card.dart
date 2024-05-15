import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/trainer_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/remove_section/trainer_remove_card_decoration.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/widgets/professional_card.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class TrainerTabCard extends StatelessWidget {
  const TrainerTabCard({super.key, required this.model, required this.size});
  final TrainerCardModel model;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      height: size.height / 6,
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
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 4,
              width: MediaQuery.sizeOf(context).width / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/image/temp/Frame1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ProfessionalCard(),
                        GestureDetector(
                          onTap: () {
                            // print("object");
                            showModalBottomSheet(
                                backgroundColor: AppColors.background,
                                context: context,
                                builder: (BuildContext context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Remove From Favorites?',
                                          textAlign: TextAlign.center,
                                          style: TextStyles.blackCardTextStyle
                                              .copyWith(fontSize: 16),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Divider(
                                          color: AppColors.n30StrokeColor,
                                        ),
                                      ),
                                      TrainerRemoveCardDecoration(
                                        model: trainerCardModel[model.id],
                                        size: size,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: AppColors.n20Gray,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyles
                                                        .textStyleSemiBold
                                                        .copyWith(
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: AppColors.d300Danger,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    // setState(() {
                                                    //   trainerCardModel.removeAt(widget.model.id);
                                                    // });
                                                  },
                                                  child: Text(
                                                    'Yes, Remove',
                                                    style: TextStyles
                                                        .textStyleSemiBold
                                                        .copyWith(
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.background,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                          child: const Icon(
                            Icons.favorite,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    model.name,
                    style: TextStyles.blackCardTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Trainer',
                    style: TextStyles.cardTextStyle.copyWith(
                      color: AppColors.n100Gray,
                      fontSize: 11,
                    ),
                  ),
                  Row(
                    children: [
                      SimpleStarRating(
                        allowHalfRating: true,
                        starCount: 5,
                        rating: model.rating,
                        size: 16,
                        spacing: 2,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${model.rating}',
                        style: TextStyles.textStyleRegular
                            .copyWith(fontSize: 11, color: AppColors.n900Black),
                      ),
                      Text(
                        ' | ',
                        style: TextStyles.textStyleRegular.copyWith(
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        model.reviews,
                        style: TextStyles.textStyleRegular.copyWith(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
