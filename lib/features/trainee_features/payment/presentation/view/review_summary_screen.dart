import 'package:flutter/material.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/trainee_features/payment/presentation/view/payment_successfully_screen.dart';
import 'package:forme_app/features/trainee_features/payment/presentation/view/widgets/review_summary_body.dart';

class ReviewSummaryScreen extends StatelessWidget {
  static const routeName = '/review-summary-screen';
  const ReviewSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Review Summary'),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ReviewSummaryBody(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 180,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Continue',
              onTap: () {
                Navigator.of(context).push(
                    PageSlideTransition(const PaymentSuccessfullyScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
