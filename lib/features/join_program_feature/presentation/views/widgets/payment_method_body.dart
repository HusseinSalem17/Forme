import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_radio_list_tile.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class PaymentMethodBody extends StatefulWidget {
  const PaymentMethodBody({
    super.key,
  });

  @override
  State<PaymentMethodBody> createState() => _PaymentMethodBodyState();
}

List<String> options = [
  'Cash',
  'Add New Card',
  'Paypal',
  'Apple Pay',
];

class _PaymentMethodBodyState extends State<PaymentMethodBody> {
  String currantOption = options[0];
  final subTitleStyle = TextStyles.textStyleSemiBold.copyWith(
    fontSize: 16,
    color: AppColors.neutralsN9,
  );
  final sizeBox = SizedBox(height: 16.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cash',
              style: subTitleStyle,
            ),
            sizeBox,
            buildCustomRadioListTile(
                0,
                SvgPicture.asset(
                  'assets/image/Icon/cash.svg', // Replace with the path to your SVG file
                )),
            sizeBox,
            Text(
              'Credit & Debit',
              style: subTitleStyle,
            ),
            sizeBox,
            buildCustomRadioListTile(
                1,
                SvgPicture.asset(
                  'assets/image/Icon/visa.svg', // Replace with the path to your SVG file
                )),
            sizeBox,
            Text(
              'More Payment Options',
              style: subTitleStyle,
            ),
            SizedBox(height: 8.h),
            buildCustomRadioListTile(
                2,
                SvgPicture.asset(
                  'assets/image/Icon/paypal.svg', // Replace with the path to your SVG file
                )),
            SizedBox(height: 8.h),
            buildCustomRadioListTile(
                3,
                SvgPicture.asset(
                  'assets/image/Icon/apple.svg', // Replace with the path to your SVG file
                )),
          ],
        ),
      ),
    );
  }

  CustomRadioListTile buildCustomRadioListTile(int index, Widget icon) {
    return CustomRadioListTile(
      title: options[index],
      value: options[index],
      groupValue: currantOption,
      onChanged: (val) {
        setState(() {
          currantOption = val!;
        });
      },
      icon: icon,
    );
  }
}
