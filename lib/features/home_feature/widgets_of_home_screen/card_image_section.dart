import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';


class CardImageSection extends StatelessWidget {
  const CardImageSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          SizedBox(
            height: size.height / 3.75 / 2,
            width: size.width / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/image/m.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7, right: 7),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.p300PrimaryColor,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}