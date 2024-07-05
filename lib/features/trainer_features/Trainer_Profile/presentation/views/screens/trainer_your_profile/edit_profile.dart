import 'package:extended_phone_number_input/consts/enums.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forme_app/core/utils/styles.dart';
import 'package:forme_app/core/widgets/app_fields/custom_data_field.dart';
import 'package:forme_app/core/widgets/app_fields/custom_phone_field.dart';
import 'package:forme_app/core/widgets/text_area.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../core/widgets/app_drop_list/custom_drop_list.dart';
import '../../../../../../../core/widgets/app_fields/custom_text_field.dart';
import '../../../../../../../core/widgets/custom_app_bar_arrow_button.dart';
import '../../../../../../../core/widgets/image_picker/profile_image_picker.dart';
import '../../../manager/my_profile_cubit/cubit/profile_cubit.dart';

class MyProfileTrainer extends StatefulWidget {
  static const routeName = '/my-profile-screen';
  const MyProfileTrainer({super.key});

  @override
  State<MyProfileTrainer> createState() => _MyProfileTrainerState();
}

class _MyProfileTrainerState extends State<MyProfileTrainer> {
  final TextEditingController _nameController = TextEditingController();
  late final ValueNotifier<String?> genderNotifier;
  late final ValueNotifier<String?> countryNotifier;
  late final ValueNotifier<String?> sportFieldNotifier;
  late final PhoneNumberInputController _phoneNumberController =
      PhoneNumberInputController(context);
  String? image, name, phone, birth, gender, country, sportField, bio;
  String? iniBirth, iniGender, iniCountry, iniSportField, iniBio;
  XFile? _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // Set default text for the TextField
    _nameController.text = "Hussein Salem";
    _phoneNumberController.init(
      initialPhoneNumber: '1224822101',
    );
    iniBirth = '30-09-2002';
    iniGender = 'female';
    iniCountry = 'Egypt';
    iniSportField = 'Handball';
    iniBio = 'ahmed ramy is best trainer ';
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = ['male', 'female'];
    final List<String> countryItems = ['Egypt', 'USA'];
    final List<String> sportFieldItems = [
      'Fitness',
      'Football',
      'Tennis',
      'Swimming',
      'Basketball',
      'Volleyball',
      'Handball',
      'Running',
      'Cycling',
      'Boxing',
      'Yoga',
      'Pilates',
      'Dancing',
      'Golf',
      'Horse Riding',
      'Skiing',
      'Skating',
      'Surfing',
      'Sailing',
      'Bowling',
      'Billiards',
      'Chess',
      'Shooting'
    ];

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
                "Edit Profile",
                style: TextStyles.textStyleBold
                    .copyWith(fontSize: 18.sp, color: AppColors.n900Black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    context
                        .read<ProfileTrainerCubit>()
                        .enableEditProfileScreen = true;
                    context
                        .read<ProfileTrainerCubit>()
                        .getTrainerProfileDetails();
                  });
                },
                child: context
                        .read<ProfileTrainerCubit>()
                        .enableEditProfileScreen
                    ? SvgPicture.asset('assets/image/Icon/success.svg')
                    : Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppColors.n50dropShadowColor.withOpacity(0.5),
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
              ),

              //
            ],
          ),
        ),
        body: BlocConsumer<ProfileTrainerCubit, ProfileTrainerState>(
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
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
                  onImageSelected: (file) {
                    setState(() {
                      _imageFile = file;
                    });
                  },
                ),
                SizedBox(height: 16.0.h),
                Text(
                  'Ahmed Ramy',
                  textAlign: TextAlign.center,
                  style: TextStyles.textStyleBold.copyWith(
                    color: AppColors.n900Black,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 32.0.h),
                CustomTextField(
                  controller: _nameController,
                  title: 'Full Name',
                  hintStyle: TextStyles.hintStyle,
                  hintText: 'Hussein Salem Eldesokey',
                  keyboardType: TextInputType.name,
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
                  onChanged: (value) {
                    setState(() => name = value);
                  },
                ),
                SizedBox(height: 16.h),
                CustomPhoneField(
                  title: 'Phone Number',
                  initialCountry: 'EG',
                  controller: _phoneNumberController,
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
                  optional: true,
                  allowPickFromContacts: false,
                  countryListMode: CountryListMode.dialog,
                  showSelectedFlag: false,
                  border: textFieldBorder(
                      color: AppColors.n30StrokeColor, width: 2.w),
                  onChanged: (value) => phone = value,
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Gender",
                  initialValue: iniGender,
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
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
                    setState(() => gender = value);
                  },
                  selectedValueNotifier:ValueNotifier<String?>(null),
                  onSaved: (value) {},
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Country",
                  initialValue: iniCountry,
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
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
                    setState(() => country = value);
                  },
                  selectedValueNotifier: ValueNotifier<String?>(null),
                  onSaved: (value) {},
                ),
                SizedBox(height: 16.h),
                CustomDropList(
                  title: "Sport Field",
                  initialValue: iniSportField,
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
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
                    setState(() => sportField = value);
                  },selectedValueNotifier: ValueNotifier<String?>(null),
                  onSaved: (value) {},
                ),
                SizedBox(height: 16.h),
                CustomDateField(
                  initialDate: iniBirth,
                  onChanged: (value) => birth = value,
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
                ),
                SizedBox(height: 16.h),
                TextArea(
                  initialValue: iniBio,
                  onChanged: (value) => bio = value,
                  titleColor: AppColors.n900Black,
                  title: 'Tell us about yourself',
                  enabled: context
                      .read<ProfileTrainerCubit>()
                      .enableEditProfileScreen,
                  hintText: 'Please share a brief description about yourself',
                ),
                SizedBox(height: 32.h),
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
// BlocProvider.of<LoginCubit>(context)
//                               .loginUser(email: email!, password: passWord!);