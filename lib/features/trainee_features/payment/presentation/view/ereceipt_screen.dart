import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/text_list.dart';

class EReceiptScreen extends StatelessWidget {
  static const routeName = '/e-receipt-screen';
  final List<String> title1 = [
    'Duration',
    'Workout',
    'Level',
    'Amount',
    'Tax',
    'Total',
  ];
  final List<String> title2 = [
    'Payment Method',
    'PaymentStatus',
    'Trainscation ID',
  ];
  //temp lists
  final List<String> values1 = [
    '1.2Hours',
    '10',
    'Begginer',
    '\$1500.00',
    '\$5.00',
    '\$1505.00',
  ];
  final List<String> values2 = ['Paypal', 'Paid', '#RF2564HG23'];
  EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            CustomAppBarArrowButton(onTap: () {
              Navigator.pop(context);
            }),
            const Spacer(),
            Text(
                textAlign: TextAlign.center,
                'E-Receipt',
                style: TextStyles.textStyleBold
                    .copyWith(fontSize: 18.sp, color: AppColors.n900Black)),
            const Spacer(),
            SizedBox(
              width: 32.w,
            )
          ]),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/image/temp/barcode.svg'),
                  const Divider(
                    thickness: 2,
                    color: AppColors.n40Gray,
                  ),
                  TextList(title: title1, values: values1),
                  const Divider(
                    thickness: 2,
                    color: AppColors.n40Gray,
                  ),
                  TextList(title: title2, values: values2),
                ],
              ),
            ),
            const Spacer(),
            ButtonContainer(
              buttonTitle: 'Download E-Receipt',
              onTap: () {},
            )
          ],
        ));
  }
}
