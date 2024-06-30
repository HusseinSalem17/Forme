import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';

import '../../../../../trainer_features/dashboard/presentation/views/manager/bloc/trainer_home_bloc.dart';
/// ************************************************************
/// ************************************************************
/// ************************************************************
/// ************************************************************
/// ******************This File Must Be Deleted*****************
/// ************************************************************
/// ************************************************************
/// ************************************************************
/// ************************************************************
/// ************************************************************

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.icons,
    required this.labels,
    required this.isTrainer,
  }) : super(key: key);
  final List<String> icons;
  final List<String> labels;
  final bool isTrainer;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: List<BottomNavigationBarItem>.generate(
        5,
        (int index) {
          return customNavigationBarItem(
              widget.icons[index], widget.labels[index]);
        },
      ),
      currentIndex: widget.isTrainer
          ? BlocProvider.of<TrainerHomeBloc>(context).currentIndex
          : BlocProvider.of<TraineeHomeBloc>(context).currentIndex,
      onTap: (index) {
        setState(() {
          widget.isTrainer
              ? BlocProvider.of<TrainerHomeBloc>(context).getCurrentIndex(index)
              : BlocProvider.of<TraineeHomeBloc>(context);
        });
      },
      unselectedItemColor: AppColors.n100Gray,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      showUnselectedLabels: true,
    );
  }

  BottomNavigationBarItem customNavigationBarItem(String icon, String label) {
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
