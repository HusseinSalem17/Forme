import 'package:flutter/material.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/payment_successfully_body.dart';
import 'package:forme_app/features/preferences/presentation/views/widgets/custom_shadow_button.dart';

class PaymentSuccessfullyScreen extends StatelessWidget {
  const PaymentSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Text('')),
      body: Stack(
        children: [
          const PaymentSuccessfullyBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomShadowButton(
              onTap: () {
                print('Hi');
              },
              buttonTitle: 'View E-Receipt',
              buttonSubTitle: 'Go To Home',
              subTitleOnTap: () {
                print('Go to home');
              },
            ),
          )
        ],
      ),
    );
  }
}
