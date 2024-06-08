import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainer_features/my_services/data/my_workout_card_model.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/widgets/program_cards.dart';

class MyWorkoutTab extends StatelessWidget {
  const MyWorkoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 12.0.h, top: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: myWorkoutsCardsModel.length,
                  itemBuilder: (context, index) => CardsItem(
                    isPrograms: false,
                    type: myWorkoutsCardsModel[index].type,
                    reviews: myWorkoutsCardsModel[index].reviews,
                    rating: myWorkoutsCardsModel[index].rating,
                    title: myWorkoutsCardsModel[index].title,
                    clients: myWorkoutsCardsModel[index].clients,
                    price: myWorkoutsCardsModel[index].price,
                    videos: myWorkoutsCardsModel[index].videos,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
