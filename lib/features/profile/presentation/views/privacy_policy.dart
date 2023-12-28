import 'package:flutter/material.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  static const routeName = '/privacy-policy-screen';
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Privacy Policy'),
      body: const Center(child: Text('privacy and policy')),
    );
  }
 
}


