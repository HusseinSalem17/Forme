import 'package:flutter/material.dart';
import 'package:forme_app/core/widgets/simple_app_bar.dart';

class MyProfile extends StatelessWidget {
  static const routeName = '/my-profile-screen';
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleAppBar(context, 'My Profile'),
        body: const SizedBox());
  }
}
