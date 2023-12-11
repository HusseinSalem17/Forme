import 'package:flutter/material.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Payment Methods',
          style: TextStyles.appTitleStyle,
        ),
      ),
    );
  }
}
