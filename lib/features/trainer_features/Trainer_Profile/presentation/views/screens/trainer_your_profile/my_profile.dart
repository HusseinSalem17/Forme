import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../core/widgets/app_drop_list/custom_drop_list.dart';
import '../../../../../../../core/widgets/app_fields/custom_text_field.dart';
import '../../../../../../../core/widgets/custom_app_bar_arrow_button.dart';
import '../../../../../../user_features/profile/presentation/views/complete_profile_widgets/profile_image_picker.dart';
import '../../../../../../user_features/profile/presentation/views/widgets/my_profile_phone_field.dart';
import '../../../manager/my_profile_cubit/cubit/my_profile_cubit.dart';


class MyProfileTrainer extends StatefulWidget {
  static const routeName = '/my-profile-screen';
  const MyProfileTrainer({super.key});

  @override
  State<MyProfileTrainer> createState() => _MyProfileTrainerState();
}

class _MyProfileTrainerState extends State<MyProfileTrainer> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  //final TextEditingController _birthController = TextEditingController();
  //final TextEditingController _countryController = TextEditingController();
  //final TextEditingController _goalController = TextEditingController();
  //final TextEditingController _physicalActivityLevelController =
  //    TextEditingController();
  String? name, phone, birth, gender, country;
  XFile? _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // Set default text for the TextField
    _nameController.text = "Hussein Salem";
    _phoneController.text = "0124822101";
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = ['Male', 'Female'];
  final List<String> countryItems = ['Egypt', 'USA'];
  final List<String> sportFieldItems = ['Fitness', 'Football', 'Tennis', 'Swimming', 'Basketball', 'Volleyball', 'Handball', 'Running', 'Cycling', 'Boxing', 'Yoga', 'Pilates', 'Dancing', 'Golf', 'Horse Riding', 'Skiing', 'Skating', 'Surfing', 'Sailing', 'Bowling', 'Billiards', 'Chess', 'Shooting'];
    bool adjustable = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
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
                "My Profile",
                style: TextStyles.textStyleBold.copyWith(
                    fontSize: 18.sp, color: AppColors.n900PrimaryTextColor),
              ),
              const Spacer(),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.n50dropShadowColor.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(4.h),
                  child: SvgPicture.asset(
                    "assets/image/Icon/edit.svg",
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                onPressed: () {},
                //
              )
            ],
          ),
        ),
        body: BlocConsumer<MyProfileTrainerCubit, MyProfileTrainerState>(
          listener: (context, state) {
            // ... (unchanged)
          },
          builder: (context, state) {
            var listView = ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height: 16.0.h),
                ProfileImagePicker(
                  imageFile: _imageFile,
                  onImageSelected: (file) {
                    setState(() {
                      _imageFile = file;
                    });
                  },
                ),
                SizedBox(height: 32.0.h),
                CustomTextField(
                  controller: _nameController,
                  title: 'Full Name',
                  hintText: 'Hussein Salem Eldesokey',
                  keyboardType: TextInputType.name,
                  enabled: adjustable,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                const MyProfilePhoneField(
                  phone: '01224822101',
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Country",
                  enabled: adjustable,
                  hint: const Text('Select Country'),
                  items: countryItems
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select country.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {},
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Sport Field",
                  enabled: adjustable,
                  hint: const Text('Select Your Sport Field'),
                  items: sportFieldItems
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your sport field.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {},
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Gender",
                  enabled: adjustable,
                  hint: const Text('select Gender'),
                  items: genderItems
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Gender.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {},
                )
              ],
            );
            return Form(
              key: _formKey,
              child: listView,
            );
          },
        ));
  }
}
