import 'package:flutter/material.dart';
import 'package:forme_app/core/utils/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkColor;
  final Color selectedColor;
  final Color borderColor;
  final double borderWidth;
  final double size;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkColor = Colors.black,
    this.selectedColor = AppColors.primaryColor, // Add selected color property
    this.borderColor = AppColors.n40Gray,
    this.borderWidth = 2.0,
    this.size = 24.0,
  }) : super(key: key);

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: _value ? widget.selectedColor : Colors.white,
          border: Border.all(
            color: _value ? Colors.black.withOpacity(0.3) : widget.borderColor,
            width: widget.borderWidth,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: _value
            ? Icon(
                Icons.check,
                size: 12,
                color: widget.checkColor,
              )
            : null,
      ),
    );
  }
}
