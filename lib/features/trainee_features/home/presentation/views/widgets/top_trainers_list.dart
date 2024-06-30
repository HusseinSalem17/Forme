import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/features/trainee_features/Trainer_details/presentation/views/trainer_details_view.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/home_bloc.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/top_trainer_item.dart';

class TopTrainersList extends StatelessWidget {
  final void Function()? onTap;

  const TopTrainersList({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Trainers',
                style: TextStyles.largeBold,
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'See all',
                  style: TextStyles.baseRegular.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<TraineeHomeBloc, TraineeHomeState>(
          builder: (context, state) {
            if (state is GetTopTrainersLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetTopTrainersSuccess) {
              return SizedBox(
                height: 80.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.trainerProfileData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 24)
                          : const EdgeInsets.symmetric(horizontal: 8),
                      child: TopTrainerItem(
                        trainer: state.trainerProfileData[index],
                      ),
                    );
                  },
                ),
              );
            } else if (state is GetTopTrainersFailure) {
              return Text('Error: ${state.errorMsg}');
            }
            return Container(
              height: 200,
              width: 200,
              color: Colors.red,
            );
          },
        ),
      ],
    );
  }
}
