import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';

import '../../../../../trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.icons,
    required this.labels,
    required this.isTrainer,
  }) : super(key: key);

  final List<String> icons;
  final List<String> labels;
  final bool isTrainer;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TraineeHomeBloc, TraineeHomeState>(
      builder: (context, homeState) {
        return BlocBuilder<TraineeHomeBloc, TraineeHomeState>(
          builder: (context, trainerState) {
            int currentIndex = widget.isTrainer
                ? BlocProvider.of<TrainerHomeBloc>(context).currentIndex
                : BlocProvider.of<TraineeHomeBloc>(context).currentIndex;

            return BottomNavigationBar(
              items: List<BottomNavigationBarItem>.generate(
                5,
                (int index) {
                  return customNavigationBarItem(
                      widget.icons[index], widget.labels[index], currentIndex);
                },
              ),
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  BlocProvider.of<TraineeHomeBloc>(context)
                      .add(HomeBottomNav(index));
                });
              },
              unselectedItemColor: AppColors.n100Gray,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              showUnselectedLabels: true,
            );
          },
        );
      },
    );
  }

  BottomNavigationBarItem customNavigationBarItem(
      String icon, String label, int currentIndex) {
    final bool isSelected = widget.isTrainer
        ? BlocProvider.of<TrainerHomeBloc>(context).currentIndex ==
            widget.icons.indexOf(icon)
        : BlocProvider.of<TraineeHomeBloc>(context).currentIndex ==
            widget.icons.indexOf(icon);

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/image/Icon/$icon.svg',
        height: 20.h,
        width: 20.w,
        color: isSelected ? AppColors.primaryColor : AppColors.n100Gray,
      ),
      label: label,
    );
  }
}
