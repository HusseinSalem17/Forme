import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/sections/add_workout_body.dart';

class AddWorkoutScreen extends StatefulWidget {
  static const routeName = '/add-workout-screen';
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  get _imageFile => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CustomAppBarArrowButton(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            Text(
              'Add Workout',
              style: TextStyles.textStyleBold
                  .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
            ),
            const Spacer(),
            GestureDetector(
              child: SvgPicture.asset('assets/image/Icon/success.svg'),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: const Center(
            child: SingleChildScrollView(
          child: AddWorkoutBody(),
        )),
      ),
    );
  }
}
