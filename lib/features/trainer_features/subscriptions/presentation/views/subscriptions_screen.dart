import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/screens/clients_subscriptions.dart';
import 'package:forme_app/features/trainer_features/subscriptions/presentation/views/screens/your_clubs.dart';

class SubscriptionsScreen extends StatelessWidget {
  static const String routeName = '/subscriptions_route';
  final String textId;
  const SubscriptionsScreen({super.key, this.textId = 'hussein_salem17'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 75.h,
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: CustomAppBarArrowButton(
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Text('Club Subscriptions', style: TextStyles.heading4Bold.copyWith(fontSize: 18.sp)),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 48.h,
            width: MediaQuery.of(context).size.width,
            color: AppColors.n20FillBodyInSmallCardColor,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/image/Icon/hash.svg', color: AppColors.n900PrimaryTextColor),
                      SizedBox(
                        width: 16.w,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Trainer ID: ',
                          style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: textId,
                              style: TextStyles.textStyleSemiBold.copyWith(color: AppColors.p300PrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: SvgPicture.asset('assets/image/Icon/copy.svg'),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: textId));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 50.h),
                          content: Row(
                            children: [
                              SvgPicture.asset('assets/image/Icon/correct-icon.svg'),
                              SizedBox(
                                width: 8.0.w,
                              ),
                              Text('Trainer ID Copied successfully.', style: TextStyles.textStyleSemiBold.copyWith(fontSize: 12.sp, color: AppColors.n400color)),
                            ],
                          ),
                          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.dg), bottomRight: Radius.circular(10.dg))),
                          duration: const Duration(seconds: 2),
                          dismissDirection: DismissDirection.up,
                          behavior: SnackBarBehavior.floating,
                          showCloseIcon: true,
                          closeIconColor: AppColors.n100Color,
                          backgroundColor: AppColors.p75PrimaryColor,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Text(
                  'Retrieve your trainer ID from your profile or simply click the copy icon above, then share it through your personal page to showcase clients who have chosen you as their coach within the club.',
                  style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YourClubsScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/image/Icon/club.svg'),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Your Clubs',
                            style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YourClubsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                const Divider(
                  color: AppColors.n20FillBodyInSmallCardColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClientsSubscriptionsScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/image/Icon/users.svg'),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Clients Subscriptions',
                            style: TextStyles.textStyleRegular.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClientsSubscriptionsScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.n20FillBodyInSmallCardColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
