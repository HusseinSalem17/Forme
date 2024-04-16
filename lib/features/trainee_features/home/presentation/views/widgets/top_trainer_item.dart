import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/test_models/top_trainers_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/icons_image_pathes.dart';
import '../../../../../../core/utils/text_styles.dart';

class TopTrainerItem extends StatelessWidget {
  final int index;
  final bool isExpert;

  const TopTrainerItem({Key? key, required this.index, this.isExpert = true})
      : super(key: key);

  String truncateText(String text, int maxLength) {
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}..';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    topTrainersData[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (topTrainersData[index].isExpert)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Stack(
                    fit: StackFit.passthrough,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17 / 2),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        expertIcon,
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            truncateText(topTrainersData[index].name, 8),
            style: TextStyles.smallRegular.copyWith(
              fontSize: 12,
              color: AppColors.n900Black,
            ),
          )
        ],
      ),
    );
  }
}
