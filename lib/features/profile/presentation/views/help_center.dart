import 'package:flutter/material.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';

class HelpCenter extends StatelessWidget {
  static const routeName = '/help-center-screen';
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Help Center'),
      body: const Center(child: Text('helpCenter')),);
  }
}