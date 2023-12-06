import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/about_sections/button_container.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/about_sections/about_trainer_section.dart';
import 'package:forme_app/features/Trainer_ditails/presentation/views/sections/about_sections/review_section.dart';
import 'package:forme_app/features/home/presentation/views/widgets/special_programs_list.dart';

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const AboutTrainer(),
            const ProgramsCardList(),
            const ReviewsSection(),
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
