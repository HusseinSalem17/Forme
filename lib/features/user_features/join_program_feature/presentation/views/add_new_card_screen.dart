import 'package:flutter/material.dart';
import 'package:forme_app/features/user_features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';

import '../../../book_appointment_with _trainer/presentation/views/add_new_card_screen.dart';
import '../../../preferences/presentation/views/widgets/custom_shadow_button.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(
        title: Text('Add New Card'),
      ),
      body: Stack(
        children: [
          const CustomCreditCard(),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomShadowButton(
              onTap: () {
                debugPrint('Hi');
              },
              buttonTitle: 'Add Card',
            ),
          )
        ],
      ),
    );
  }
}



