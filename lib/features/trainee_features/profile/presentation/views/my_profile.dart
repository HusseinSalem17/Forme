import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/text_styles.dart';
import 'package:forme_app/core/widgets/custom_app_bar_arrow_button.dart';
import 'package:forme_app/core/widgets/app_drop_list/custom_drop_list.dart';
import 'package:forme_app/core/widgets/app_fields/custom_text_field.dart';
import 'package:forme_app/core/widgets/image_picker/profile_image_picker.dart';
import 'package:forme_app/features/trainee_features/profile/presentation/views/widgets/my_profile_phone_field.dart';
import 'package:image_picker/image_picker.dart';
import '../manager/cubit/my_profile_cubit.dart';

class MyProfile extends StatefulWidget {
  static const routeName = '/my-profile-screen';
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late ValueNotifier<String?> countryNotifier;

  String? name, phone, birth, height, weight, goal, gender, country;
  XFile? _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _nameController.text = "Hussein Salem";
    _phoneController.text = "0124822101";
    _heightController.text = "175";
    _weightController.text = "75";
    countryNotifier = ValueNotifier<String?>(null);
    super.initState();


  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> countryItems = ['Egypt', 'USA'];
    final List<String> goalItems = [
      'Get Fitter',
      'Gain Weight',
      'Lose Weight',
      'Building Muscles',
      'Improve Endurance',
      'Learn The Basics',
    ];
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
                style: TextStyles.textStyleBold
                    .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
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
        body: BlocConsumer<MyProfileCubit, MyProfileState>(
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
                  hintStyle: TextStyles.headerStyle,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _heightController,
                        title: 'Height',
                        hintText: '175',
                        keyboardType: TextInputType.number,
                        enabled: adjustable, hintStyle: TextStyles.headerStyle,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4.dg),
                      ),
                      padding: EdgeInsets.all(10.h),
                      child: Text(
                        'CM',
                        style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 14.sp, color: AppColors.background),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _weightController,
                        title: 'weight',
                        hintText: '75', hintStyle: TextStyles.headerStyle,
                        keyboardType: TextInputType.number,
                        enabled: adjustable,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4.dg),
                      ),
                      padding: EdgeInsets.all(10.h),
                      child: Text(
                        'KG',
                        style: TextStyles.textStyleRegular.copyWith(
                            fontSize: 14.sp, color: AppColors.background),
                      ),
                    )
                  ],
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
                  onSaved: (value) {}, selectedValueNotifier: countryNotifier,
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Goal",
                  enabled: adjustable,
                  hint: const Text('Select Your Goal'),
                  items: goalItems
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your goal.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {},
                  selectedValueNotifier: countryNotifier,
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Physical Activity Level",
                  enabled: adjustable,
                  hint: const Text('select Physical Activity Level'),
                  items: countryItems
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select physical activity level.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {},
                  selectedValueNotifier: countryNotifier,
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
