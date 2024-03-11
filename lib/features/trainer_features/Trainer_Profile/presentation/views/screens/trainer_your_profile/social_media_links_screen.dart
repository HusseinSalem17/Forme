import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/widgets/button_container.dart';
import '../../../../../../../core/widgets/simple_app_bar.dart';
import '../../../../../trainer_preference/presentation/views/widgets/links_text_field.dart';

class SocialMediaLinksScreen extends StatelessWidget {
  const SocialMediaLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Social Media Links'),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
            child: Column(
              children: [
                const LinksTextField(
                  hintText: 'facebook (link)',
                  logo: 'facebook',
                ),
                SizedBox(height: 8.h),
                const LinksTextField(
                  hintText: 'instagram (link)',
                  logo: 'instagram_colored',
                ),
                SizedBox(height: 8.h),
                const LinksTextField(
                  hintText: 'youtube (link)',
                  logo: 'youtube',
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Save Changes',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
