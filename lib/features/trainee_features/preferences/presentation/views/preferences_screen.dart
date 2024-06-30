import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/trainee_home_screen_bottom_nav.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/trainee_features/preferences/presentation/views/widgets/custom_preferences_page_veiw.dart';

import '../manager/preferences_bloc.dart';

class PreferencesScreen extends StatefulWidget {
  static const routeName = '/preferences-screen';

  const PreferencesScreen({Key? key}) : super(key: key);

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

PageController pageViewController = PageController(initialPage: 0);

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          CustomPreferencesPageView(
            pageViewController: pageViewController,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: ButtonContainer(
                buttonTitle: 'Next',
                onTap: () {
                  if (BlocProvider.of<PreferencesBloc>(context).state.page <
                      4) {
                    pageViewController.animateToPage(
                      BlocProvider.of<PreferencesBloc>(context).state.page + 1,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.of(context).pushReplacement(
                      PageSlideTransition(
                        const TraineeHomeScreenBottomNav(),
                      ),
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
