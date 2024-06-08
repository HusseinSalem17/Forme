import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/flutter_toast.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/manager/cubit/trainer_preference_cubit.dart';

import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/screens/complete_screen.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/trainer_features/trainer_preference/presentation/views/widgets/custom_preferences_page_veiw.dart';

class TrainerPreferenceScreen extends StatefulWidget {
  static const routeName = '/trainer-preferences-screen';

  const TrainerPreferenceScreen({Key? key}) : super(key: key);

  @override
  State<TrainerPreferenceScreen> createState() =>
      _TrainerPreferenceScreenState();
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
      body: BlocListener<TrainerPreferenceCubit, TrainerPreferenceState>(
        listener: (context, state) {
          if (state is TrainerPreferenceSuccess) {
            Navigator.of(context)
                .push(PageSlideTransition(const CompletePreferenceScreen()));
          } else if (state is TrainerPreferenceFailure) {
            showCustomSnackbar(
              context,
              "Network problem. Please check your internet connection and try again.",
              AppColors.w75Color,
              1,
            );
          }
        },
        child: Stack(
          children: [
            CustomPreferencesPageView(
              pageViewController: pageViewController,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
                  BlocBuilder<TrainerPreferenceCubit, TrainerPreferenceState>(
                builder: (context, state) {
                  return ButtonContainer(
                    isLoad: state is TrainerPreferenceLoading ? true : false,
                    buttonTitle: 'Next',
                    onTap: () {
                      if (context.read<TrainerPreferenceCubit>().page < 1) {
                        pageViewController.animateToPage(
                          context.read<TrainerPreferenceCubit>().page + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        context
                            .read<TrainerPreferenceCubit>()
                            .putTrainerPreference();
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
