import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/icons_image_pathes.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../data/models/trainer_profile_model.dart';

class TopTrainerItem extends StatelessWidget {
  final TrainerProfile trainer;

  const TopTrainerItem({
    Key? key,
    required this.trainer,
  }) : super(key: key);

  String truncateText(String text, int maxLength) {
    return (text.length <= maxLength)
        ? text
        : '${text.substring(0, maxLength)}..';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: trainer.user.profilePicture == null
                    ? Container()
                    : Image.network(
                        trainer.user.profilePicture!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            if (trainer.verified)
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
          truncateText(trainer.user.username, 8),
          style: TextStyles.smallRegular.copyWith(
            fontSize: 12,
            color: AppColors.n900Black,
          ),
        )
      ],
    );
  }
}
