import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';

import 'package:forme_app/features/user_features/join_program_feature/presentation/views/widgets/custom_radio_list_tile.dart';
import 'package:forme_app/features/user_features/payment/presentation/view/add_new_card_screen.dart';
import 'package:forme_app/features/user_features/payment/presentation/view/widgets/add_new_card_card.dart';

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
                  'assets/image/Icon/cash.svg',
                )),
            sizeBox,
            Text(
              'Credit & Debit',
              style: subTitleStyle,
            ),
            sizeBox,
            addNewCardCard(() {
              Navigator.of(context)
                  .push(PageSlideTransition(const AddNewCardScreen()));
            }),
            sizeBox,
            Text(
              'More Payment Options',
              style: subTitleStyle,
            ),
            SizedBox(height: 8.h),
            buildCustomRadioListTile(
              2,
              SvgPicture.asset(
                'assets/image/Icon/paypal.svg',
              ),
            ),
            SizedBox(height: 8.h),
            buildCustomRadioListTile(
              3,
              SvgPicture.asset(
                'assets/image/Icon/apple.svg',
              ),
            ),
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
