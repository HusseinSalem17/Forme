import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

class BookAppointmentScreen extends StatelessWidget {
  static const routeName = '/book-appointment-screen';

  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeBox = SizedBox(
      height: 16.h,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    'https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77701968267.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2 - 61,
                        top: -61,
                        child: Column(
                          children: [
                            Container(
                              height: 122,
                              width: 122,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(61),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(61),
                                  child: Image.asset(
                                    'assets/image/m.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Kareem Muhamed',
                              style: TextStyles.textStyleSemiBold.copyWith(
                                color: AppColors.n900Black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Trainer',
                              style: TextStyles.textStyleSemiBold.copyWith(
                                color: AppColors.n70Gray,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColors.n20FillBodyInSmallCardColor,
                              ),
                              sizeBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      'BOOK APPOINTMENT',
                                      style:
                                          TextStyles.textStyleRegular.copyWith(
                                        color: AppColors.n70Gray,
                                      ),
                                    ),
                                  ),
                                  sizeBox,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Text(
                                      'Day',
                                      style:
                                          TextStyles.textStyleSemiBold.copyWith(
                                        color: AppColors.n900Black,
                                      ),
                                    ),
                                  ),
                                  sizeBox,
                                  SizedBox(
                                    height: 43,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Container(
                                            width: 71,
                                            height: 43,
                                            decoration: ShapeDecoration(
                                              color: AppColors.primaryColor,
                                              shadows: [
                                                BoxShadow(
                                                  color: AppColors
                                                      .n50dropShadowColor
                                                      .withOpacity(0.4),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                              shape: SmoothRectangleBorder(
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                  cornerRadius: 20,
                                                  cornerSmoothing: 3,
                                                ),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'data',
                                                  style: TextStyles
                                                      .textStyleRegular
                                                      .copyWith(
                                                    color:
                                                        AppColors.n70Gray,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  '17 Jul',
                                                  style: TextStyles
                                                      .textStyleSemiBold
                                                      .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 1000,
            )
          ],
        ),
      ),
    );
  }
}
