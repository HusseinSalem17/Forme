import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/join_program_feature/presentation/views/widgets/custom_app_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/functions/validators.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../book_appoitment_with _trainer/presentation/views/add_new_card_screen.dart';

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



