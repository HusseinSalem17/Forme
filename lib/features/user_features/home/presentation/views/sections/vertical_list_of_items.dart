

import 'package:flutter/material.dart';

import 'package:forme_app/features/user_features/home/presentation/views/widgets/vertecal_card_item.dart';

class VerticalCardsList extends StatelessWidget {
  const VerticalCardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 50,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: VerticalCardItem(size: size),
        );
      },
    );
  }
}
