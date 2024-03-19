import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/widgets/button_container.dart';

import '../../../../../../../core/widgets/simple_app_bar.dart';
import '../../../../../../user_features/profile/presentation/views/widgets/search_text_field.dart';
import '../../../../../create_sessions/presentation/views/widgets/select_package.dart';

class LanguagesSearchScreen extends StatelessWidget {
  const LanguagesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Languages'),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const Center(child: SearchTextField()),
                SizedBox(height: 16.h),
                      const SelectPackage(
                        isLanguages: true,
                        isInput: false,
                        text1: 'English',
                        text2: 'Arabic',
                        text3: 'French',
                        text4: 'Indian',
                        text5: 'Germany',
                      ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Save Changes',
              onTap: () {},
            ),),
        ],
      ),
    );
  }
}
