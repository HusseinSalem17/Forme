import 'package:flutter/material.dart';
import 'package:forme_app/features/preferences_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/preferences_feature/presentation/views/widgets/custom_preferences_page_veiw.dart';
import 'package:forme_app/features/preferences_feature/presentation/views/widgets/custom_shadow_button.dart';

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
            child: CustomShadowButton(
              pageViewController: pageViewController,
            ),
          )
        ],
      ),
    );
  }
}
