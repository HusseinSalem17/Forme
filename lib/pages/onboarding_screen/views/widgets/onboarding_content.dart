import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/pages/onboarding_screen/views/widgets/Skip_button.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.description,
    required this.titleStyle1,
    required this.titleStyle2,
  });

  final String image, title1, title2, description;
  final TextStyle titleStyle1, titleStyle2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      margin: EdgeInsets.only(top: 34.w),
      child: Column(
        children: [
          SizedBox(
            width: 345.w,
            height: 345.w,
            child: SvgPicture.asset(image),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 29.5.sp),
                  child: Center(
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: title1,
                                style: titleStyle1,
                              ),
                              TextSpan(
                                text: title2,
                                style: titleStyle2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Spacer(flex:1),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.sp),
                  child: Center(
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    description,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
