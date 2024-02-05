import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, size) => const CardsItem(
                    isPrograms: false,
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
