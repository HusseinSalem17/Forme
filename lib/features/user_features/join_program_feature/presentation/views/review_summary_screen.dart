import 'package:flutter/material.dart';
import 'package:forme_app/features/user_features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/user_features/join_program_feature/presentation/views/widgets/review_summary_body.dart';
import '../../../preferences/presentation/views/widgets/custom_shadow_button.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Review Summary'),
      ),
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
            child: CustomShadowButton(
              onTap: () {
                debugPrint('Hi');
              },
              buttonTitle: 'Continue',
            ),
          )
        ],
      ),
    );
  }
}
