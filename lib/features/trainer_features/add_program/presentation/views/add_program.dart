import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/flutter_toast.dart';
import 'package:forme_app/core/widgets/import_media.dart';
import 'package:forme_app/core/widgets/save_changes.dart';
import 'package:forme_app/features/trainer_features/add_program/data/models/program_details.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/manager/bloc/add_program_bloc.dart';
import 'package:forme_app/features/trainer_features/add_program/presentation/views/sections/add_program_body.dart';
import 'package:image_picker/image_picker.dart';

class AddProgramScreen extends StatefulWidget {
  static const routeName = '/add-program-screen';

  const AddProgramScreen({super.key});

  @override
  State<AddProgramScreen> createState() => _AddProgramScreenState();
}

class _AddProgramScreenState extends State<AddProgramScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? imageFile;
  String? imageBase64;
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController maxClientsController;
  late TextEditingController minAgeController;
  late TextEditingController capacityController;
  late TextEditingController maxAgeController;
  late ValueNotifier<String?> sportFieldNotifier;
  late ValueNotifier<String?> levelNotifier;
  late ValueNotifier<String?> typeNotifier;

  late String gender;

  @override
  void initState() {
    titleController = TextEditingController();
    maxClientsController = TextEditingController();
    descriptionController = TextEditingController();
    minAgeController = TextEditingController();
    maxAgeController = TextEditingController();
    capacityController = TextEditingController();
    sportFieldNotifier = ValueNotifier<String?>(null);
    levelNotifier = ValueNotifier<String?>(null);
    typeNotifier = ValueNotifier<String?>(null);

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();

    maxClientsController.dispose();
    descriptionController.dispose();
    minAgeController.dispose();
    maxAgeController.dispose();
    sportFieldNotifier.dispose();
    capacityController.dispose();
    levelNotifier.dispose();
    typeNotifier.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AddProgramBloc, AddProgramState>(
        listener: (context, state) {
          if (state is AddProgramSuccess) {
            Navigator.pop(context);
          } else if (state is AddProgramFailure) {
            showCustomSnackbar(
                context,
                "Network problem. Please check your internet connection and try again.",
                AppColors.w75Color,
                1);
          }
        },
        builder: (context, state) {
          return Form(
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
                            'Add Program',
                            style: TextStyles.textStyleBold.copyWith(
                                fontSize: 18.sp, color: AppColors.n900Black),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                ProgramDataModel data = ProgramDataModel(
                                  cover: imageBase64,
                                  title: titleController.text,
                                  capacity: int.parse(capacityController.text),
                                  sportField: sportFieldNotifier.value,
                                  level: levelNotifier.value,
                                  type: typeNotifier.value,
                                  gender: gender,
                                  minAge: int.parse(minAgeController.text),
                                  maxAge: int.parse(maxAgeController.text),
                                  description: descriptionController.text,
                                );
                                context
                                    .read<AddProgramBloc>()
                                    .add(UpdateTrainerProgram(data));
                              }
                            },
                            child: SvgPicture.asset(
                                'assets/image/Icon/success.svg',
                                height: 32.h),
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
                          BlocBuilder<AddProgramBloc, AddProgramState>(
                            builder: (context, state) {
                              if (state is AddProgramCoverSuccess) {
                                imageFile = state.image;
                                imageBase64 = state.imageBase64;
                              }
                              return ImportMedia(
                                title: 'Add Program cover or preview',
                                onFilePicked: (file) {
                                  context
                                      .read<AddProgramBloc>()
                                      .add(CoverPicked(file!));
                                },
                              );
                            },
                          ),
                          AddProgramBody(
                            sportFieldNotifier: sportFieldNotifier,
                            levelNotifier: levelNotifier,
                            typeNotifier: typeNotifier,
                            capacityController: capacityController,
                            titleController: titleController,
                            genderNotifier: (value) => gender = value,
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
          );
        },
      ),
    );
  }
}
