import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/features/trainer_features/add_workout/presentation/view/sections/add_workout_body.dart';
import 'package:image_picker/image_picker.dart';

class AboutWorkout extends StatefulWidget {
  const AboutWorkout({super.key});

  @override
  State<AboutWorkout> createState() => _AboutWorkoutState();
}

class _AboutWorkoutState extends State<AboutWorkout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageFile;
  String? imageBase64;
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController offerController;
  late TextEditingController descriptionController;
  late TextEditingController maxClientsController;
  late TextEditingController minAgeController;
  late TextEditingController maxAgeController;
  late ValueNotifier<String?> sportFieldNotifier;
  late ValueNotifier<String?> levelNotifier;
  late bool isOffer = false;

  @override
  void initState() {
    titleController = TextEditingController();
    priceController = TextEditingController();
    offerController = TextEditingController();
    maxClientsController = TextEditingController();
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
    maxClientsController.dispose();
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
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              // BlocBuilder<WorkOutBloc, WorkOutState>(
              //   builder: (context, state) {
              //     if (state is WorkOutCoverSuccess) {
              //       imageFile = state.image;
              //       imageBase64 = state.imageBase64;
              //     }
              //     return ImportMedia(
              //       title: 'Add Program cover or preview',
              //       onFilePicked: (file) {
              //         context.read<WorkOutBloc>().add(CoverPicked(file!));
              //       },
              //     );
              //   },
              // ),
              AddWorkoutBody(
                sportFieldNotifier: sportFieldNotifier,
                levelNotifier: levelNotifier,
                titleController: titleController,
                priceController: priceController,
                offerPriceController: offerController,
                isOffer: (value) => isOffer = value,
                genderNotifier: (value) {
                          // gender = value;
                          // print(gender);
                        },
                maxClientsController: maxClientsController,
                descriptionController: descriptionController,
                minAgeController: minAgeController,
                maxAgeController: maxAgeController,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
