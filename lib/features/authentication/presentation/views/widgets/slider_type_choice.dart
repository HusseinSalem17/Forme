import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/core/utils/app_colors.dart';
import 'package:forme_app/core/utils/icons_image_pathes.dart';
import 'custom_selected_type_item.dart';

class SliderTypeChoice extends StatefulWidget {
  final void Function(UserType userType)
      onUserTypeSelected; // Callback function

  const SliderTypeChoice({
    Key? key,
    required this.onUserTypeSelected, // Constructor parameter
  }) : super(key: key);

  @override
  State<SliderTypeChoice> createState() => _SingInAndUpHeader();
}

class _SingInAndUpHeader extends State<SliderTypeChoice>
    with SingleTickerProviderStateMixin {
  double _start = 220.w;
  bool _clientIsChecked = true;

  @override
  void initState() {
    super.initState();
  }

  void _moveLeft() {
    setState(() {
      _start -= 140.w;
      if (_start <= 80.w) _start = 80.w;
    });
    widget.onUserTypeSelected(
      UserType.trainer,
    ); // Notify parent with selected user type
  }

  void _moveRight() {
    setState(() {
      _start += 140.w;
      if (_start >= 220.w) {
        _start = 220.w;
      }
    });
    widget.onUserTypeSelected(
      UserType.trainee,
    ); // Notify parent with selected user type
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSelectedType(
                title: 'I\'m a trainer',
                icon: trainer,
                color: _clientIsChecked
                    ? AppColors.n80NavColor
                    : AppColors.primaryColor,
                onTap: () {
                  _moveLeft();
                  _clientIsChecked = false;
                },
              ),
              CustomSelectedType(
                title: 'I\'m a Client',
                icon: trainee,
                color: _clientIsChecked
                    ? AppColors.primaryColor
                    : AppColors.n80NavColor,
                onTap: () {
                  _moveRight();
                  _clientIsChecked = true;
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
          child: Stack(
            children: [
              AnimatedPositionedDirectional(
                start: _start,
                duration: const Duration(milliseconds: 100),
                child: Container(
                  width: 50,
                  height: 2,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
