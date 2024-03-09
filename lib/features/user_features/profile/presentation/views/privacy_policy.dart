import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  static const routeName = '/privacy-policy-screen';
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cancellation Policy',
                style: TextStyles.textStyleBold.copyWith(fontSize: 16.sp, height: 2.5, color: AppColors.p300PrimaryColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Convallis ultrices cursus maecenas ac. Laoreet imperdiet hendrerit morbi risus. Vestibulum ultrices nulla non habitant eleifend. Commodo malesuada amet mauris blandit lacus nunc dui proin tellus. Cursus varius hendrerit velit amet massa gravida amet. Risus feugiat dui sapien vel quis et odio. Ipsum est quam amet et ipsum. Sit gravida curabitur pulvinar urna curabitur ac. Facilisis platea in vestibulum proin sed morbi elit non. Massa platea velit nec at faucibus lorem diam egestas. Tincidunt aliquet porta congue ac eu ultrices elementum integer pharetra.',
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n300Color),
              ),
              Text(
                'Terms & Condition',
                style: TextStyles.textStyleBold.copyWith(fontSize: 16.sp, height: 2.5, color: AppColors.p300PrimaryColor),
              ),
              Text(
                'Lorem ipsum dolor sit amet consectetur. In amet volutpat nullam vitae. Velit nunc amet tempor at convallis eget. Eget consectetur ac pulvinar libero et fames gravida id facilisis. Amet pharetra dolor proin eget ac senectus. Feugiat pretium in varius tortor tincidunt tristique velit velit tincidunt. Erat augue euismod justo varius nulla neque nam adipiscing. Elementum maecenas nec sapien fusce semper facilisis. Vitae in viverra enim egestas fringilla. Nunc vestibulum nunc faucibus velit tellus id et nunc. Dignissim imperdiet tristique pretium massa. Mattis sollicitudin nec eget fermentum proin lorem ultricies. A felis quis morbi massa massa tempor. Erat nec sit mollis turpis. Ac gravida diam tempor amet blandit posuere eget vitae natoque. Ornare sodales sit libero porttitor nec fringilla. Urna quis nec pellentesque metus urna eu. Orci ultrices ridiculus maecenas faucibus tortor. Hendrerit at sit praesent non elementum justo in aenean. Curabitur aenean volutpat sed odio eget lectus ultrices. Eget vitae in velit dui egestas. Sit volutpat luctus egestas massa commodo diam. Consectetur augue a felis commodo cras. Nec augue viverra et metus est egestas facilisis. Nunc sit tortor fermentum egestas tempus ipsum. Donec purus dui leo odio hac velit gravida. Mattis commodo ultrices pellentesque diam egestas est aenean vivamus mauris. Nam ut vestibulum dis placerat ac euismod elementum mauris. Feugiat et eget mi urna in cursus. A gravida dis risus facilisis morbi. Turpis aliquam nullam arcu nisl id ut. Vestibulum ut lacus iaculis praesent magna non maecenas. Dolor facilisis vel enim tempus. In blandit pharetra proin non ultrices nulla lacus adipiscing est. Sed vitae gravida pretium ut. Felis scelerisque eu tincidunt enim hendrerit commodo. Egestas dolor aliquam magna velit cursus amet. Nunc montes elementum accumsan nisi enim purus auctor quis. Augue rutrum ut pharetra pellentesque venenatis turpis massa. Sed egestas orci ut porta. Integer amet est feugiat purus. Tortor sem ornare blandit convallis at. Sollicitudin tortor sagittis vestibulum nibh. Faucibus feugiat volutpat tortor magna ipsum. Semper nascetur scelerisque lacus viverra neque vel et nunc amet. Sed rutrum condimentum fermentum dui maecenas laoreet. Habitant nunc fermentum et vel. Bibendum facilisis turpis eu fames purus sem est lorem nibh. Risus interdum imperdiet sed enim. Diam urna bibendum morbi cursus nec massa fames elementum aliquam. Penatibus praesent integer diam euismod maecenas cras lacus feugiat. Commodo vel sit iaculis aliquet sit id ut. Ut tellus suspendisse risus sagittis volutpat vel nunc vel sed. Aliquam blandit tellus ridiculus sit sed elit vivamus mauris. Aliquam turpis eget habitasse vitae magna. Pharetra sed elit natoque amet non consequat. Nulla ipsum eleifend libero consectetur. Nec sed nulla nec volutpat. Pretium dis proin et lectus vel enim neque vestibulum facilisis. Viverra sem vitae praesent condimentum maecenas eu id mattis scelerisque.',
                style: TextStyles.textStyleRegular.copyWith(fontSize: 14.sp, color: AppColors.n300Color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
