import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/simple_app_bar.dart';
import '../../../data/reviews_card_model.dart';
import '../widgets/reviews_card.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: simpleAppBar(context, 'Reviews'),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reviewsCardModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ReviewsCard(
                      model: reviewsCardModel[index],
                      size: size,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
