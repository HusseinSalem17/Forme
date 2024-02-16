import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/trainer_preference_bloc.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/screens/complete_screen.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/custom_preferences_page_veiw.dart';

class TrainerPreferenceScreen extends StatefulWidget {
  static const routeName = '/trainer-preferences-screen';

  const TrainerPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<TrainerPreferenceScreen> createState() => _TrainerPreferenceScreenState();
}

PageController pageViewController = PageController(initialPage: 0);

class _TrainerPreferenceScreenState extends State<TrainerPreferenceScreen> {
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
                  if (BlocProvider.of<TrainerPreferenceBloc>(context).state.page < 1) {
                  pageViewController.animateToPage(
                    BlocProvider.of<TrainerPreferenceBloc>(context).state.page + 1,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeIn,
                  );}
                  else  {Navigator.of(context)
                    .pushReplacement(PageSlideTransition(const CompletePreferenceScreen()));}
                },
              )
        
              )
        ],
      ),
    );
  }
}
