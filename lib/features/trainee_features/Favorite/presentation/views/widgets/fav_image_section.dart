import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/programs_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/sports_club_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/workout_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/remove_section/programs_remove_card_decoration.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/remove_section/sports_remove_card_decoration.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/remove_section/workout_remove_card_decoration.dart';

class FavCardImageSection extends StatefulWidget {
  const FavCardImageSection({
    super.key,
    required this.height,
    required this.width,
    this.bottomPadding = 8,
    this.leftPaddingIcon = 130,
    this.topPaddingIcon = 5,
    required this.id,
    required this.category,
  });

  final double height, width, bottomPadding, topPaddingIcon, leftPaddingIcon;
  final int id;
  final String category;

  @override
  State<FavCardImageSection> createState() => _FavCardImageSectionState();
}

class _FavCardImageSectionState extends State<FavCardImageSection> {
  bool isTabbed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding),
      child: Stack(
        children: [
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/image/workout_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: widget.topPaddingIcon,
            left: widget.leftPaddingIcon,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.background,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Remove From Favorites?',
                              textAlign: TextAlign.center,
                              style: TextStyles.blackCardTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: AppColors.n30StrokeColor,
                            ),
                          ),
                          if (widget.category == 'Workout')
                            WorkoutRemoveCardDecoration(
                              size: size,
                              model: workoutCardData[widget.id],
                            )
                          else if (widget.category == 'Programs')
                            ProgramsRemoveCardDecoration(
                              model: programsCardModel[widget.id],
                              size: size,
                            )
                          else if (widget.category == 'Sports Club')
                            SportsClubRemoveCardDecoration(
                              model: sportsClubCardModel[widget.id],
                              size: size,
                            ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.n20Gray,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyles.textStyleSemiBold.copyWith(
                                          fontSize: 12,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.d300Danger,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          isTabbed = true;
                                        });
                                      },
                                      child: Text(
                                        'Yes, Remove',
                                        style: TextStyles.textStyleSemiBold.copyWith(
                                          fontSize: 12,
                                          color: AppColors.background,
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
              child: const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
