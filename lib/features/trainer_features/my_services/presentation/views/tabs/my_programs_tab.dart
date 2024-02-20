import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainer_features/my_services/data/my_programs_cards_model.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/widgets/program_cards.dart';

class MyProgramsTab extends StatelessWidget {
  const MyProgramsTab({super.key});

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
                  itemCount: myProgramsCardsModel.length,
                  itemBuilder: (context, index) => CardsItem(
                    isPrograms: true,
                    type: myProgramsCardsModel[index].type,
                    state: myProgramsCardsModel[index].state,
                    reviews: myProgramsCardsModel[index].reviews,
                    rating: myProgramsCardsModel[index].rating,
                    title: myProgramsCardsModel[index].title,
                    clients: myProgramsCardsModel[index].clients,
                    price: myProgramsCardsModel[index].price,
                    duration: myProgramsCardsModel[index].duration,
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
