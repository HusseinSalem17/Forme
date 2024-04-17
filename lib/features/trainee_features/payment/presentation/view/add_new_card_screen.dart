import 'package:flutter/material.dart';
import 'package:forme_app/core/widgets/button_container.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';
import 'package:forme_app/features/trainee_features/payment/presentation/view/widgets/add_new_card_body.dart';

class AddNewCardScreen extends StatelessWidget {
  static const routeName = '/add-new-card-screen';
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Payment Methods'),
      body: Stack(
        children: [
          const CustomCreditCard(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonContainer(
              buttonTitle: 'Continue',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
