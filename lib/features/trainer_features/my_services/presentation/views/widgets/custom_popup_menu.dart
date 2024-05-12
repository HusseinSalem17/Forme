import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainer_features/my_services/presentation/views/screens/cancellation_screen.dart';


class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key, this.isCancellation = false});
  final bool isCancellation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PopupMenuButton(
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.n100Gray,
          ),
          color: AppColors.background,
          surfaceTintColor: Colors.transparent,
          position: PopupMenuPosition.under,
          constraints: const BoxConstraints(
            minWidth: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<dynamic>>[
              const PopupMenuItem(
                height: 35,
                child: Text(
                  'Message',
                ),
              ),
              const PopupMenuItem(
                height: 35,
                child: Text(
                  'View Profile',
                ),
              ),
              if (isCancellation)
                PopupMenuItem(
                  height: 35,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.d300Danger),
                  ),
                  onTap: () {
                    if (kDebugMode) {
                      print('Cancel');
                    }
                    Navigator.of(context).push(PageSlideTransition(const CancellationScreen()));
                  },
                ),
            ],
        ),
      ],
    );
  }
}
