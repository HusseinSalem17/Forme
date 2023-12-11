import 'package:flutter/material.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/coach_plan_details_section.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_sliver_app_bar.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/plans_list_view.dart';

import '../../../preferences/presentation/views/preferences_screen.dart';
import '../../../preferences/presentation/views/widgets/custom_shadow_button.dart';

class BookOnlineCoachScreen extends StatefulWidget {
  const BookOnlineCoachScreen({Key? key}) : super(key: key);

  @override
  BookOnlineCoachScreenState createState() => BookOnlineCoachScreenState();
}

class BookOnlineCoachScreenState extends State<BookOnlineCoachScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0; // Initialize _scrollOffset here

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              CustomSliverAppBar(scrollOffset: _scrollOffset),
              const SliverToBoxAdapter(
                child: CoachPlanDetailsSection(),
              ),
              const PlansListView(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 155), // Adjust the height as needed
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomShadowButton(
              onTap: () {
                print('Hi');
              },
              buttonTitle: 'Send Request To Join',
              buttonSubTitle:
                  'Please note that your cancellation is free of charge\nif the trainer does not accept the request',
            ),
          )
        ],
      ),
    );
  }
}
