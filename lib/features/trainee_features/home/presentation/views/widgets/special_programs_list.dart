import 'package:flutter/material.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_card_item.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/workout_detail.dart';

class SpecialProgramsList extends StatelessWidget {
  const SpecialProgramsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageSlideTransition(
            const WorkOutDetail(),
          ),
        );
      },
      child: SizedBox(
        height: size.height / 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 24)
                  : const EdgeInsets.symmetric(horizontal: 8),
              child: SpecialProgramsCardItem(size: size),
            );
          },
        ),
      ),
    );
  }
}
