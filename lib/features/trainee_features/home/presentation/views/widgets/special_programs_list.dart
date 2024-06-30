import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forme_app/core/transitions/page_slide.dart';
import 'package:forme_app/features/trainee_features/home/presentation/manager/bloc/special_programs_bloc/special_programs_bloc.dart';
import 'package:forme_app/features/trainee_features/home/presentation/views/widgets/special_programs_card_item.dart';
import 'package:forme_app/features/trainee_features/workout_detail/presentation/views/workout_detail.dart';


class SpecialProgramsList extends StatelessWidget {
  const SpecialProgramsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageSlideTransition(
            const WorkOutDetail(),
          ),
        );
      },
      child: BlocBuilder<SpecialProgramsBloc, SpecialProgramsState>(
        builder: (context, state) {
          if (state is GetSpecialProgramsLoading) {
            return const CircularProgressIndicator();
          } else if (state is GetSpecialProgramsSuccess) {
            return SizedBox(
              height: size.height / 3.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.trainerProfileProgramData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 24)
                        : const EdgeInsets.symmetric(horizontal: 8),
                    child: SpecialProgramsCardItem(
                      size: size,
                      trainerProfileProgram:
                          state.trainerProfileProgramData[index],
                    ),
                  );
                },
              ),
            );
          } else if (state is GetSpecialProgramsFailure) {
            return Text('Error: ${state.errorMsg}');
          }
          return Container(
            height: 200,
            width: 200,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
