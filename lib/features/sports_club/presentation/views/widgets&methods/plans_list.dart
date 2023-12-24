import 'package:flutter/material.dart';
import 'package:forme_app/features/sports_club/data/models/club_card_model.dart';
import 'package:forme_app/features/sports_club/data/models/club_icon_model.dart';
import 'package:forme_app/features/sports_club/presentation/views/widgets&methods/club_card.dart';

class PlansList extends StatelessWidget {
  const PlansList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          clubIconData.length,
          (int index) {
            return ClubCard(model: clubCardData[index]);
          },
        ),
      ),
    );
  }
}
