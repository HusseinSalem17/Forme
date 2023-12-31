import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_radio_list_tile.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/review_summary_body.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
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
                print('Hi');
              },
              buttonTitle: 'Continue',
            ),
          )
        ],
      ),
    );
  }
}
