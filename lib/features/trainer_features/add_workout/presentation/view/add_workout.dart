import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/gender.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/image_picker/profile_image_picker.dart';
import 'package:forme_app/core/widgets/import_media.dart';
import 'package:forme_app/features/trainer_features/add_workout/data/models/workout_details.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/manager/bloc/work_out_bloc.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/sections/add_workout_body.dart';
import 'package:image_picker/image_picker.dart';

class AddWorkoutScreen extends StatefulWidget {
  static const routeName = '/add-workout-screen';

  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageFile;
  String? imageBase64;
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController offerController;
  late TextEditingController descriptionController;
  late TextEditingController minAgeController;
  late TextEditingController maxAgeController;
  late ValueNotifier<String?> sportFieldNotifier;
  late ValueNotifier<String?> levelNotifier;
  late bool isOffer;

  @override
  void initState() {
    titleController = TextEditingController();
    priceController = TextEditingController();
    offerController = TextEditingController();
    descriptionController = TextEditingController();
    minAgeController = TextEditingController();
    maxAgeController = TextEditingController();
    sportFieldNotifier = ValueNotifier<String?>(null);
    levelNotifier = ValueNotifier<String?>(null);

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    offerController.dispose();
    descriptionController.dispose();
    minAgeController.dispose();
    maxAgeController.dispose();
    sportFieldNotifier.dispose();
    levelNotifier.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      CustomAppBarArrowButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      Text(
                        'Add Workout',
                        style: TextStyles.textStyleBold.copyWith(
                            fontSize: 18.sp, color: AppColors.n900Black),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {
                          WorkoutDataModel data = WorkoutDataModel(
                              //cover: imageBase64,
                              title: titleController.text,
                              price: int.parse(priceController.text),
                              sportField: sportFieldNotifier.value!,
                              level: levelNotifier.value!,
                              //gender: Gender.male,
                              isOffer: isOffer,
                              offerPrice: int.parse(offerController.text),
                              minAge: int.parse(minAgeController.text),
                              maxAge: int.parse(maxAgeController.text),
                              description: descriptionController.text,
                              files: []);

                          context
                              .read<WorkOutBloc>()
                              .add(UpdateTrainerWorkout(data));
                        },
                        child:
                            SvgPicture.asset('assets/image/Icon/success.svg'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      color: AppColors.n20Gray,
                      borderRadius: BorderRadius.circular(14.dg)),
                  child: Column(
                    children: [
                      BlocBuilder<WorkOutBloc, WorkOutState>(
                        builder: (context, state) {
                          if (state is WorkOutCoverSuccess) {
                            imageFile = state.image;
                            imageBase64 = state.imageBase64;
                          }
                          return ImportMedia(
                            title: 'Add Program cover or preview',
                            onFilePicked: (file) {
                              context
                                  .read<WorkOutBloc>()
                                  .add(CoverPicked(file!));
                            },
                          );
                        },
                      ),
                      AddWorkoutBody(
                        sportFieldNotifier: sportFieldNotifier,
                        levelNotifier: levelNotifier,
                        titleController: titleController,
                        priceController: priceController,
                        offerPriceController: offerController,
                        isOffer: (value) => isOffer = value,
                        descriptionController: descriptionController,
                        minAgeController: minAgeController,
                        maxAgeController: maxAgeController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
