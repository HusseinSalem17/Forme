import 'package:flutter/material.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings-screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(context, 'Settings'),
      body: const Center(child: Text('settings')),
    );
  }
}
