import 'package:flutter/material.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';
import '../../../book_appointment_with _trainer/presentation/views/add_new_card_screen.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Add New Card'),
      ),
      body: CustomCreditCard(),
    );
  }
}



