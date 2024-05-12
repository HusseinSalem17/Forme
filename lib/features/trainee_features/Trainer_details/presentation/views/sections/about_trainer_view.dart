import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/sections/about_sections/button_container.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/sections/about_sections/about_trainer_section.dart';
import 'package:forme_app/features/trainee_features/reviews/presentation/views/reviews_section.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_list.dart';

class AboutTrainerScreen extends StatefulWidget {
  const AboutTrainerScreen({
    super.key,
  });

  @override
  State<AboutTrainerScreen> createState() => _AboutTrainerScreenState();
}

class _AboutTrainerScreenState extends State<AboutTrainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const AboutTrainer(),
            const SpecialProgramsList(),
            const ReviewsSection(
              type: 'workout',
            ),
            SizedBox(height: 100.h)
          ]),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: ButtonContainer(
            buttonTitle: 'Book Appointment',
          ),
        )
      ],
    );
  }
}
