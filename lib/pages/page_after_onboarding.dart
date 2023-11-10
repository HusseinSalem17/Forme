import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/image_assets.dart';

class PageAfterOnBoarding extends StatefulWidget {
  const PageAfterOnBoarding({super.key});

  @override
  State<PageAfterOnBoarding> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<PageAfterOnBoarding> {
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