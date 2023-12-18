import 'package:flutter/material.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/payment_method_body.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../preferences/presentation/views/widgets/custom_shadow_button.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Payment Methods'),
      ),
      body: Stack(
        children: [
          const PaymentMethodBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomShadowButton(
              onTap: () {
                debugPrint('Hi');
              },
              buttonTitle: 'Continue',
            ),
          )
        ],
      ),
    );

  }
}
