import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/build_table.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/coach_plan_details.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_sliver_app_bar.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/plans_list_view.dart';
import 'package:ionicons/ionicons.dart';


class BookOnlineCoachScreen extends StatelessWidget {
  const BookOnlineCoachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          CustomSliverAppBar(
            scrollController: scrollController,
          ),
          const SliverToBoxAdapter(
            child: CoachPlanDetails(),
          ),
          const PlansListView()
        ],
      ),
    );
  }


}



