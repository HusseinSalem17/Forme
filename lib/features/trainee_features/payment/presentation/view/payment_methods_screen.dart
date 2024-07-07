import 'package:flutter/material.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/trainee_features/payment/presentation/view/review_summary_screen.dart';
import 'package:forme_app/features/trainee_features/payment/presentation/view/widgets/payment_method_body.dart';

class PaymentMethodsScreen extends StatefulWidget {
  static const routeName = '/payment-method-screen';

  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Payment Methods'),
      body: Stack(
        children: [
          const PaymentMethodBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Continue',
              onTap: () {
                Navigator.of(context).push(
                  PageSlideTransition(
                    const ReviewSummaryScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
