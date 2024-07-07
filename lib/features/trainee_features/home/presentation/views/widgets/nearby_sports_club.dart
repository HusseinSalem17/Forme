import 'package:flutter/material.dart';
import '../../../../../../core/test_models/top_trainers_model.dart';
import 'nearby_sports_club_item.dart';

class NearbySpotsClub extends StatelessWidget {
  final double listHeight;
  final void Function()? onTap;

  const NearbySpotsClub({
    super.key,
    this.listHeight = 3.5,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList.builder(
      itemBuilder: (context, index) {
        return VerticalCardItem(
          size: size,
          topTrainersModel: topTrainersData[index],
        );
      },
      itemCount: topTrainersData.length,
    );
  }
}
