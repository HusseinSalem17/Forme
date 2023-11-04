import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor :Colors.white,
      body : Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    AssetsImages.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
    );
    
  }
}