import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/programs_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/sports_club_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/trainer_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/data/workout_card_model.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/tabs_cards/programs_tab_card.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/tabs_cards/sports_club_tab_card.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/tabs_cards/trainer_tab_card.dart';
import 'package:forme_app/features/trainee_features/Favorite/presentation/views/tabs/tabs_cards/workout_tab_card.dart';

class FilterType extends StatefulWidget {
  const FilterType({Key? key, required this.type, required this.categories})
      : super(key: key);
  final String type;
  final List<String> categories;

  @override
  _FilterTypeState createState() => _FilterTypeState();
}

class _FilterTypeState extends State<FilterType> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.categories.map((category) {
            var index = widget.categories.indexOf(category);
            return Padding(
              padding: EdgeInsets.only(
                right: 8.w,
              ),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.primaryColor
                      : AppColors.n20Gray,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      if (widget.type == 'Workout') {
                        if (category == 'All') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: workoutCardData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: WorkoutTabCard(
                                    size: size,
                                    model: workoutCardData[index],
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (category == 'GYM') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: workoutCardData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      workoutCardData[index].typeCard == 'GYM'
                                          ? WorkoutTabCard(
                                              size: size,
                                              model: workoutCardData[index],
                                            )
                                          : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'YOGA') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: workoutCardData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      workoutCardData[index].typeCard == 'Yoga'
                                          ? WorkoutTabCard(
                                              size: size,
                                              model: workoutCardData[index],
                                            )
                                          : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Running') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: workoutCardData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: workoutCardData[index].typeCard ==
                                          'Running'
                                      ? WorkoutTabCard(
                                          size: size,
                                          model: workoutCardData[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Boxing') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: workoutCardData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: workoutCardData[index].typeCard ==
                                          'Boxing'
                                      ? WorkoutTabCard(
                                          size: size,
                                          model: workoutCardData[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        }
                      } else if (widget.type == 'programs') {
                        if (category == 'All') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: programsCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: ProgramsTabCard(
                                    size: size,
                                    model: programsCardModel[index],
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (category == 'GYM') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: programsCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: programsCardModel[index].type == 'GYM'
                                      ? ProgramsTabCard(
                                          size: size,
                                          model: programsCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'YOGA') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: programsCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: programsCardModel[index].type == 'Yoga'
                                      ? ProgramsTabCard(
                                          size: size,
                                          model: programsCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Running') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: programsCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      programsCardModel[index].type == 'Running'
                                          ? ProgramsTabCard(
                                              size: size,
                                              model: programsCardModel[index],
                                            )
                                          : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Boxing') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: programsCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      programsCardModel[index].type == 'Boxing'
                                          ? ProgramsTabCard(
                                              size: size,
                                              model: programsCardModel[index],
                                            )
                                          : Container(),
                                );
                              },
                            ),
                          );
                        }
                      } else if (widget.type == 'trainer') {
                        if (category == 'All') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: trainerCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: TrainerTabCard(
                                    size: size,
                                    model: trainerCardModel[index],
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (category == 'GYM') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: trainerCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      trainerCardModel[index].category == 'GYM'
                                          ? TrainerTabCard(
                                              size: size,
                                              model: trainerCardModel[index],
                                            )
                                          : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'YOGA') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: trainerCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      trainerCardModel[index].category == 'Yoga'
                                          ? TrainerTabCard(
                                              size: size,
                                              model: trainerCardModel[index],
                                            )
                                          : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Running') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: trainerCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: trainerCardModel[index].category ==
                                          'Running'
                                      ? TrainerTabCard(
                                          size: size,
                                          model: trainerCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Boxing') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: trainerCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: trainerCardModel[index].category ==
                                          'Boxing'
                                      ? TrainerTabCard(
                                          size: size,
                                          model: trainerCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        }
                      } else if (widget.type == 'sports club') {
                        if (category == 'All') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: sportsClubCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: SportsClubTabCard(
                                    size: size,
                                    model: sportsClubCardModel[index],
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (category == 'GYM') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: sportsClubCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: sportsClubCardModel[index].category ==
                                          'GYM'
                                      ? SportsClubTabCard(
                                          size: size,
                                          model: sportsClubCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'YOGA') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: sportsClubCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: sportsClubCardModel[index].category ==
                                          'Yoga'
                                      ? SportsClubTabCard(
                                          size: size,
                                          model: sportsClubCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Running') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: sportsClubCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: sportsClubCardModel[index].category ==
                                          'Running'
                                      ? SportsClubTabCard(
                                          size: size,
                                          model: sportsClubCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        } else if (category == 'Boxing') {
                          Expanded(
                            child: ListView.builder(
                              itemCount: sportsClubCardModel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: sportsClubCardModel[index].category ==
                                          'Boxing'
                                      ? SportsClubTabCard(
                                          size: size,
                                          model: sportsClubCardModel[index],
                                        )
                                      : Container(),
                                );
                              },
                            ),
                          );
                        }
                      }
                    });
                  },
                  child: Text(
                    category,
                    style: TextStyles.textStyleRegular.copyWith(
                      fontSize: 16.sp,
                      color: selectedIndex == index
                          ? AppColors.background
                          : AppColors.n100Gray,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
