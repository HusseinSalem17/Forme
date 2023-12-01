

import 'package:flutter/material.dart';
import 'package:forme_app/features/home/presentation/views/widgets/specila_programs_card_item.dart';

class SpecialProgramsCardList extends StatelessWidget {
  const SpecialProgramsCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SpecialProgramsCardItem(size: size),
          );
        },
      ),
    );
  }
}
