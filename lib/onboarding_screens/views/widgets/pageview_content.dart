import 'package:flutter/material.dart';

import 'onboarding_content.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.description,
    required this.titleStyle1,
    required this.titleStyle2,
    required this.index,
    required this.context,
  });

  final int index;
  final BuildContext context;
  final String image, title1, title2, description;
  final TextStyle titleStyle1, titleStyle2;

  @override
  Widget build(BuildContext context) {
    return OnBoardingContent(
        image: image,
        title1: title1,
        title2: title2,
        description: description,
        titleStyle1: titleStyle1,
        titleStyle2: titleStyle2);
  }
}

/// don't delete this comment

